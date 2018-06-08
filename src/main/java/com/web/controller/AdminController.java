package com.web.controller;

import com.web.bean.*;
import com.web.service.ApplicationService;
import com.web.service.MessageService;
import com.web.service.ScholarService;
import com.web.service.UserService;
import com.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @Autowired
    public AdminController(ApplicationService applicationService, UserService userService, ScholarService scholarService, MessageService messageService) {
        this.applicationService = applicationService;
        this.userService = userService;
        this.scholarService = scholarService;
        this.messageService = messageService;
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

    @RequestMapping(value = "admin/checkapplication", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> checkApplication(HttpSession session,
                                                    @RequestParam("approve") Boolean approve,
                                                    @RequestParam("applicationId") Integer applicationId) {
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
            scholar.setCredit(user.getCredit());
            scholar.setDegree(user.getDegree());
            scholar.setEmail(user.getEmail());
            scholar.setUsername(user.getUsername());
            scholar.setPassword(user.getPassword());
            scholar.setPhone(user.getPhone());
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
        messageService.insertMessage(message);
        HashMap<String, String> map = new HashMap<>();
        map.put("info", "成功");
        return map;
    }
}
