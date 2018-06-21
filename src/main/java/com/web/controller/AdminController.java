package com.web.controller;

import com.web.bean.*;
import com.web.service.ApplicationService;
import com.web.service.MessageService;
import com.web.service.InstituteService;
import com.web.service.ScholarService;
import com.web.service.UserService;
import com.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AdminController {
    private final ApplicationService applicationService;
    private final UserService userService;
    private final ScholarService scholarService;
    private final MessageService messageService;
    private final InstituteService instituteService;

    @Autowired
    public AdminController(ApplicationService applicationService, UserService userService, ScholarService scholarService, MessageService messageService, InstituteService instituteService) {
        this.applicationService = applicationService;
        this.userService = userService;
        this.scholarService = scholarService;
        this.messageService = messageService;
        this.instituteService = instituteService;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "admin/application", method = RequestMethod.GET)
    public String displayApplication(HttpSession session, Model model) {
        if (Setting.ADMIN_ID != (Integer) session.getAttribute("id")) {
            return null;
        }

        List<Application> applications = applicationService.selectAll();
        applications = applications.stream()
                .sorted(Comparator.comparing(Application::getId).reversed())
                .collect(Collectors.toList());
        List<Institute> institutes = instituteService.selectAll();
        model.addAttribute("applications", applications);
        model.addAttribute("institutes", institutes);
        return "admin";
    }

    @RequestMapping(value = "admin/checkapplication", method = RequestMethod.POST)
    @ResponseBody
    public String checkApplication(HttpSession session,
                                                    @RequestParam("approve") Boolean approve,
                                                    @RequestParam("applicationId") Integer applicationId,
                                                    Model model) {
        if (Setting.ADMIN_ID != (Integer) session.getAttribute("id")) {
            return null;
        }
        Application application = applicationService.getApplication(applicationId);
        User user = userService.getUser(application.getUserId());
        Message message = new Message();
        message.setSenderId(Setting.ADMIN_ID);
        message.setReceiverId(user.getId());
        message.setStatus(Setting.UNREAD_APPLICATION);
        message.setSendTime(new Date());
        if (approve) {
            // 如果同意，将其加入到专家数据库，并发送站内信通知
            Scholar scholar = new Scholar();
            scholar.setId(user.getId());
            scholar.setUsername(user.getUsername());
            scholar.setIdentity(application.getIdentity());
            scholar.setInstituteId(application.getInstituteId());
            scholar.setTitle(application.getTitle());
            scholarService.addScholar(scholar);
            // 站内信
            message.setContent("您的申请已通过");
        } else {
            // 如果不同意，发送站内信通知
            message.setContent("您的申请未通过");
        }
        applicationService.delete(applicationId);
        messageService.insertMessage(message);
        model.addAttribute("info", "成功");
        List<Application> applications = applicationService.selectAll();
        applications = applications.stream()
                .sorted(Comparator.comparing(Application::getId).reversed())
                .collect(Collectors.toList());
        List<Institute> institutes = instituteService.selectAll();
        model.addAttribute("applications", applications);
        model.addAttribute("institutes", institutes);
        return "admin";
    }
}
