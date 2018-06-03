package com.web.controller;

import com.web.bean.Paper;
import com.web.bean.ScholarPaper;
import com.web.bean.UserPaper;
import com.web.exception.ParameterInvalidException;
import com.web.service.*;
import com.web.utils.Setting;
import org.apache.commons.io.FileUtils;
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
import java.io.File;
import java.io.IOException;
import java.util.HashMap;

// TODO: 删除，赠送paper
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

    @RequestMapping(value = "/{userId}/uploadfile", method = RequestMethod.GET)
    public String uploadFile() {
        return "uploadFile";
    }

    @RequestMapping(value = "/{userId}/uploadfile", method = RequestMethod.POST)
    public String uploadFile(@RequestParam(value = "file") MultipartFile file,
                             @RequestParam(value = "subject") String subject,
                             @RequestParam(value = "discipline") String discipline,
                             @PathVariable("userId") Integer scholarId,
                             Model model) {
        // 文件大小必须大于0，必须为专家用户
        if (file.getSize() > 0) {
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
                                           Model model) throws Exception {
        //下载文件路径
        // TODO: 判断是否有下载权限
        Paper paper = paperService.selectById(paperId);
        if (paper == null) {
            return null;
        }
        File file = new File(paper.getPath());
        String filename = paper.getName();
        HttpHeaders headers = new HttpHeaders();
        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", filename);
        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/deletepaper/{paperId}", method = RequestMethod.DELETE)
    @ResponseBody
    // 删除paper，AJAX
    // TODO: session获得userID并判断权限
    public HashMap<String, Object> deletePaper(@PathVariable Integer paperId) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        if (!paperService.paperExist(paperId)) {
            map.put("errorInfo", "该文献不存在");
        } else {
            paperService.deletePaper(paperId);
            map.put("info", "删除成功");
        }
        return map;
    }

    @RequestMapping(value = "/giftpaper/{paperId}/{userId}", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> giftPaper(@PathVariable(value = "paperId") Integer paperId,
                                             @PathVariable(value = "userId") Integer userId) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        if (!paperService.paperExist(paperId)) {
            map.put("errorInfo", "该文献不存在");
        } else if (!userService.userExist(userId)){
            map.put("errorInfo", "该用户不存在");
        } else {
            UserPaper userPaper = new UserPaper();
            userPaper.setPaperId(paperId);
            userPaper.setUserId(userId);
            userPaperService.insertUserPaper(userPaper);
            map.put("info", "赠送成功");
        }
        return map;
    }
}

