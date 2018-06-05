package com.web.controller;

import com.web.bean.Paper;
import com.web.service.DisciplineService;
import com.web.service.PaperService;
import com.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class DisplayPaperController {
    private final DisciplineService disciplineService;
    private final PaperService paperService;

    @Autowired
    public DisplayPaperController(DisciplineService disciplineService, PaperService paperService) {
        this.disciplineService = disciplineService;
        this.paperService = paperService;
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
        model.addAttribute("paper", papers);
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
    @RequestMapping(value = "/popularpaper/", method = RequestMethod.GET)
    public HashMap<String, List<Paper>> displayPopularPaper() {
        HashMap<String, List<Paper>> map = new HashMap<>();
        List<Paper> papers = paperService.mostPopularPaper(Setting.INDEX_PAPER_NUMBER);
        map.put("popularPaper", papers);
        return map;
    }
}
