package com.web.controller;

import com.web.bean.Paper;
import com.web.bean.ScholarPaper;
import com.web.bean.UserPaper;
import com.web.exception.ParameterInvalidException;
import com.web.service.*;
import com.web.utils.Setting;
import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;

@Controller
public class UploadController {
    private final SubjectService subjectService;
    private final DisciplineService disciplineService;
    private final ScholarService scholarService;
    private final PaperService paperService;
    private final UserService userService;
    private final UserPaperService userPaperService;
    private final ScholarPaperService scholarPaperService;

    @Autowired
    public UploadController(SubjectService subjectService, DisciplineService disciplineService, ScholarService scholarService, PaperService paperService, UserService userService, UserPaperService userPaperService, ScholarPaperService scholarPaperService) {
        this.subjectService = subjectService;
        this.disciplineService = disciplineService;
        this.scholarService = scholarService;
        this.paperService = paperService;
        this.userService = userService;
        this.userPaperService = userPaperService;
        this.scholarPaperService = scholarPaperService;
    }

    @RequestMapping(value = "/setting/uploadfile", method = RequestMethod.GET)
    public String uploadFile(HttpSession session) {
        if (session.getAttribute("logined") == null) {
            return "login";
        }
        return "uploadFile";
    }

    @RequestMapping(value = "/setting/uploadfile", method = RequestMethod.POST)
    public String uploadFile(@RequestParam(value = "file") MultipartFile file,
                             @RequestParam(value = "subject") String subject,
                             @RequestParam(value = "discipline") String discipline,
                             HttpSession session,
                             Model model) {
        // 文件大小必须大于0，必须为专家用户
        Integer scholarId = (Integer) session.getAttribute("id");
        if (file.getSize() > 0 && scholarService.scholarExist(scholarId)) {
            try {
                if (!disciplineService.disciplineExist(discipline)) {
                    throw new ParameterInvalidException("所选学科不存在");
                }
                if (!subjectService.subjectExist(subject)) {
                    throw new ParameterInvalidException("所选文献等级不存在");
                }
                // 存储paper
                File storedFile = new File(Setting.UPLOAD_ROOT + "/" + file.getOriginalFilename());
                FileUtils.copyInputStreamToFile(file.getInputStream(), storedFile);
                // 生成paper
                Paper paper = new Paper();
                paper.setDisciplineId(disciplineService.selectByName(discipline).getId());
                paper.setSubjectId(subjectService.selectByName(subject).getId());
                paper.setName(file.getOriginalFilename());
                paper.setPath(storedFile.getAbsolutePath());
                paperService.insertPaper(paper);
                Integer paperId = paperService.selectByName(file.getOriginalFilename()).getId();
                System.out.println(paperId);
                // paper与scholar关系
                ScholarPaper scholarPaper = new ScholarPaper();
                scholarPaper.setPaperId(paperId);
                scholarPaper.setScholarId(scholarId);
                scholarPaperService.insertScholarPaper(scholarPaper);
                // paper与user关系
                UserPaper userPaper = new UserPaper();
                userPaper.setPaperId(paperId);
                userPaper.setUserId(scholarId);
                userPaperService.insertUserPaper(userPaper);
            } catch (IOException e) {
                System.out.println(e.getMessage());
                model.addAttribute("errorInfo", "文件上传失败");
            } catch (ParameterInvalidException e) {
                model.addAttribute("errorInfo", e.getMessage());
            }
        }
        return "uploadFile";
    }

    @RequestMapping(value = "/download/{paperId}", method = RequestMethod.GET)
    public ResponseEntity<byte[]> download(@PathVariable Integer paperId,
                                           HttpSession httpSession,
                                           Model model) throws Exception {
        //下载文件路径
        // 用UserPaperService判断用户是否拥有此文献
        Integer userId = (Integer) httpSession.getAttribute("id");
        Paper paper = paperService.selectById(paperId);
        if (paper == null || !userPaperService.paperAccessible(userId, paperId)) {
            return null;
        }
        File file = new File(paper.getPath());
        String filename = paper.getName();
        HttpHeaders headers = new HttpHeaders();
        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", filename);
        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        // 热度加一
        paperService.addPopularity(paperId, Setting.POPULARITY_PER_DOWNLOAD);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/deletepaper", method = RequestMethod.DELETE)
    @ResponseBody
    // 删除paper，AJAX
    public HashMap<String, String> deletePaper(@RequestParam Integer paperId, HttpSession httpSession) {
        if (httpSession.getAttribute("logined") == null) {
            return null;
        }
        HashMap<String, String> map = new HashMap<>();
        // 用ScholarPaperService判断专家是否拥有此文献
        Integer userId = (Integer) httpSession.getAttribute("id");
        if (!paperService.paperExist(paperId)) {
            map.put("errorInfo", "该文献不存在");
        } else if (!scholarPaperService.paperAccessible(userId, paperId)) {
            map.put("errorInfo", "没有权限");
        } else {
            paperService.deletePaper(paperId);
            map.put("info", "删除成功");
        }
        return map;
    }

    @RequestMapping(value = "/giftpaper/", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> giftPaper(@RequestParam(value = "paperId") Integer paperId,
                                             @RequestParam(value = "userId") Integer userId,
                                             HttpSession httpSession) {
        if (httpSession.getAttribute("logined") == null) {
            return null;
        }
        HashMap<String, String> map = new HashMap<>();
        Integer scholarId = (Integer) httpSession.getAttribute("id");
        // 用ScholarPaperService判断专家是否拥有此文献
        if (!paperService.paperExist(paperId)) {
            map.put("errorInfo", "该文献不存在");
        } else if (!userService.userExist(userId)) {
            map.put("errorInfo", "该用户不存在");
        } else if (!scholarPaperService.paperAccessible(scholarId, paperId)) {
            map.put("errorInfo", "没有权限");
        } else {
            UserPaper userPaper = new UserPaper();
            userPaper.setPaperId(paperId);
            userPaper.setUserId(userId);
            userPaperService.insertUserPaper(userPaper);
            map.put("info", "赠送成功");
        }
        return map;
    }

    @RequestMapping(value = "/changeprice/", method = RequestMethod.POST)
    @ResponseBody
    // 前端传form, JSON返回
    public HashMap<String, String> changePaperPrice(@RequestParam(value = "paperId") Integer paperId,
                                                    @RequestParam("price") String money,
                                                    HttpSession session) {
        if (session.getAttribute("logined") == null) {
            return null;
        }
        Integer userId = (Integer) session.getAttribute("id");
        BigDecimal price = new BigDecimal(money);
        HashMap<String, String> map;
        map = new HashMap<String, String>();
        if (!paperService.paperExist(paperId)) {
            map.put("errorInfo", "该文献不存在");
        } else if (!scholarPaperService.paperAccessible(userId, paperId)) {
            map.put("errorInfo", "没有权限");
        } else {
            paperService.updatePrice(paperId, price);
            map.put("info", "修改成功");
        }
        return map;
    }
}

