package com.web.controller;

import com.web.bean.Paper;
import com.web.service.DisciplineService;
import com.web.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
    @RequestMapping("/discipline/{disciplineId}")
    public String displayPaperByCategory(@PathVariable Integer disciplineId, Model model) {
        if (!disciplineService.disciplineExist(disciplineId)) {
            return "404";
        }
        List<Paper> papers = paperService.selectByDiscipline(disciplineId);
        model.addAttribute("papers", papers);
        return "papers";
    }
}
