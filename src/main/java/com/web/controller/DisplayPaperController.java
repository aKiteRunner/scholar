package com.web.controller;

import com.web.bean.*;
import com.web.service.*;
import com.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class DisplayPaperController {
    private final DisciplineService disciplineService;
    private final PaperService paperService;
    private final UserService userService;
    private final UserPaperService userPaperService;
    private final CommentService commentService;
    private final ScholarPaperService scholarPaperService;
    private final ScholarService scholarService;

    @Autowired
    public DisplayPaperController(DisciplineService disciplineService, PaperService paperService, UserService userService, UserPaperService userPaperService, CommentService commentService, ScholarPaperService scholarPaperService, ScholarService scholarService) {
        this.disciplineService = disciplineService;
        this.paperService = paperService;
        this.userService = userService;
        this.userPaperService = userPaperService;
        this.commentService = commentService;
        this.scholarPaperService = scholarPaperService;
        this.scholarService = scholarService;
    }

    // 返回按照热度排行
    @RequestMapping(value = "/discipline/{disciplineId}", method = RequestMethod.GET)
    public String displayPaperByCategory(@PathVariable Integer disciplineId, Model model) {
        if (!disciplineService.disciplineExist(disciplineId)) {
            return "404";
        }
        List<Paper> papers = paperService.selectByDiscipline(disciplineId);
        papers = papers.stream()
                .sorted(Comparator.comparing(Paper::getPopularity).reversed())
                .collect(Collectors.toList());
        model.addAttribute("papers", papers);
        return "papers";
    }

    @RequestMapping(value = "/discover", method = RequestMethod.GET)
    public String displayAllPaper(Model model) {
        List<Paper> papers = paperService.mostPopularPaper(Setting.INDEX_PAPER_NUMBER);
        papers = papers.stream()
                .sorted(Comparator.comparing(Paper::getPopularity).reversed())
                .collect(Collectors.toList());
        List<Object[]> list = new ArrayList<>();
        for (Paper paper: papers) {
            Object[] temp = new Object[2];
            temp[0] = paper;
            temp[1] = scholarService.getScholar(scholarPaperService.getScholarId(paper.getId()));
            list.add(temp);
        }
        model.addAttribute("list", list);
        return "papers";
    }

    // 选出该用户下的所有文献，并按照时间即ID倒序
    @RequestMapping(value = "/repository", method = RequestMethod.GET)
    public String displayPaperByUser(Model model, HttpSession session) {
        if (session.getAttribute("logined") == null) {
            return "login";
        }
        Integer userId = (Integer) session.getAttribute("id");
        List<Paper> papers = paperService.selectByUser(userId);
        papers = papers.stream().
                sorted(Comparator.comparing(Paper::getId).reversed()).
                collect(Collectors.toList());
        model.addAttribute("paper", papers);
        return "repository";
    }

    @ResponseBody
    @RequestMapping(value = "/popularpaper", method = RequestMethod.GET)
    public HashMap<String, List<Paper>> displayPopularPaper() {
        HashMap<String, List<Paper>> map = new HashMap<>();
        List<Paper> papers = paperService.mostPopularPaper(Setting.INDEX_PAPER_NUMBER);
        map.put("popularPaper", papers);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/buypaper", method = RequestMethod.POST)
    public HashMap<String, String> buyPaper(HttpSession session, @RequestParam Integer paperId) {
        // 判断是否登录
        Integer userId = (Integer) session.getAttribute("id");
        User user = userService.getUser(userId);
        Paper paper = paperService.selectById(paperId);
        HashMap<String, String> map = new HashMap<>();
        Integer credit = user.getCredit();
        Integer price = paper.getPrice();
        if (userPaperService.paperAccessible(userId, paperId)) {
            map.put("errorInfo", "您已经拥有此文献");
        } else if (credit < price){
            map.put("errorInfo", "金额不足无法购买");
        } else {
            credit -= price;
            user.setCredit(credit);
            userService.updateUser(user);
            UserPaper userPaper = new UserPaper();
            userPaper.setUserId(userId);
            userPaper.setPaperId(paperId);
            userPaperService.insertUserPaper(userPaper);
            paperService.addPopularity(paperId, Setting.POPULARITY_PER_PURCHASE);
            map.put("info", "购买成功");
        }
        return map;
    }

    // 查看文献和评论
    @RequestMapping(value = "paper/{paperId}", method = RequestMethod.GET)
    public String displayPaper(@PathVariable Integer paperId, Model model) {
        if (!paperService.paperExist(paperId)) {
            return "404";
        }
        Paper paper = paperService.selectById(paperId);
        paperService.addPopularity(paperId, Setting.POPULARITY_PER_CLICK);
        model.addAttribute("paper", paper);
        List<Comment> comments = commentService.paperComment(paperId);
        model.addAttribute("comment", comments);
        return "paper";
    }
}
