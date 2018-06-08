package com.web.controller;


import com.web.bean.PaperForSearch;
import com.web.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SearchController {
    private final PaperService paperService;

    @Autowired
    public SearchController(PaperService paperService){
        this.paperService = paperService;
    }

    @ResponseBody
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public List search(@RequestParam(value = "query") String query){
        List list = new ArrayList();
        List<PaperForSearch> plist = paperService.selectPaperForSearch();
//        for(PaperForSearch pfs : list){
//            System.out.println(pfs.getId() + pfs.getName());
//        }

        return list;
    }
}
