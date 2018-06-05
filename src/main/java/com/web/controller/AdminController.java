package com.web.controller;

import com.web.bean.Admin;
import com.web.bean.Application;
import com.web.service.ApplicationService;
import com.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AdminController {
    private final ApplicationService applicationService;

    @Autowired
    public AdminController(ApplicationService applicationService) {
        this.applicationService = applicationService;
    }

    @RequestMapping(value = "admin/application", method = RequestMethod.GET)
    @ResponseBody
    public HashMap<String, List<Application>> displayApplication(HttpSession session) {
        if (Setting.ADMIN_ID != (Integer) session.getAttribute("id")) {
            return null;
        }
        HashMap<String, List<Application>> map = new HashMap<>();
        List<Application> applications = applicationService.selectAll();
        applications = applications.stream()
                .sorted(Comparator.comparing(Application::getId).reversed())
                .collect(Collectors.toList());
        map.put("application", applications);
        return map;
    }
}
