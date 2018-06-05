package com.web.controller;

import com.web.bean.Application;
import com.web.bean.Institute;
import com.web.bean.Message;
import com.web.service.ApplicationService;
import com.web.service.InstituteService;
import com.web.service.MessageService;
import com.web.service.UserService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MessageController {
    private final MessageService messageService;
    private final UserService userService;
    private final InstituteService instituteService;
    private final ApplicationService applicationService;

    @Autowired
    public MessageController(MessageService messageService, UserService userService, InstituteService instituteService, ApplicationService applicationService) {
        this.messageService = messageService;
        this.userService = userService;
        this.instituteService = instituteService;
        this.applicationService = applicationService;
    }

    // 返回所有站内信并标记为已读, AJAX
    @RequestMapping(value = "/setting/sentmessage", method = RequestMethod.GET)
    @ResponseBody
    public HashMap<String, List<Message>> showSentMessage(HttpSession session) {
        // 先登录
        if (session.getAttribute("logined") == null) {
            return null;
        }
        Integer userId = (Integer) session.getAttribute("id");
        HashMap<String, List<Message>> map = new HashMap<String, List<Message>>();
        List<Message> sentMessage = messageService.selectSentMessage(userId);
        sentMessage = sentMessage.parallelStream().
                sorted(Comparator.comparing(Message::getSendTime).reversed()).
                collect(Collectors.toList());
        map.put("sentMessage", sentMessage);
        return map;
    }

    @RequestMapping(value = "/setting/receivedmessage", method = RequestMethod.GET)
    @ResponseBody
    public HashMap<String, List<Message>> showReceivedMessage(HttpSession session) {
        // 先登录
        if (session.getAttribute("logined") == null) {
            return null;
        }
        Integer userId = (Integer) session.getAttribute("id");
        HashMap<String, List<Message>> map = new HashMap<>();
        List<Message> receivedMessage = messageService.selectReceivedMessage(userId);
        receivedMessage = receivedMessage.parallelStream().
                sorted(Comparator.comparing(Message::getSendTime).reversed()).
                collect(Collectors.toList());
        map.put("sentMessage", receivedMessage);
        return map;
    }

    @RequestMapping(value = "/setting/sendmessage", method = RequestMethod.POST)
    @ResponseBody
    // 传receiverId, content
    public HashMap<String, String> sendMessage(@RequestParam Integer receiverId,
                                               @RequestParam String content,
                                               HttpSession session) {
        // 先登录
        if (session.getAttribute("logined") == null) {
            return null;
        }
        Integer userId = (Integer) session.getAttribute("id");
        HashMap<String, String> map = new HashMap<>();
        if (!userService.userExist(receiverId)) {
            map.put("errorInfo", "用户不存在");
            return map;
        }
        Message message = new Message();
        message.setSenderId(userId);
        message.setReceiverId(receiverId);
        message.setContent(content);
        message.setStatus((byte) 0);
        message.setSendTime(new Date());
        messageService.insertMessage(message);
        map.put("info", "发送成功");
        return map;
    }

    @RequestMapping(value = "/setting/apply", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> applyForScholar(@RequestParam("institute") String instituteName,
                                                   @RequestParam("identity") String identity,
                                                   @RequestParam("title") String title,
                                                   HttpSession session) {
        Integer userId = (Integer) session.getAttribute("id");
        HashMap<String, String> map = new HashMap<>();
        Institute institute = instituteService.selectByName(instituteName);
        if (institute == null) {
            map.put("errorInfo", "未认证的机构");
            return map;
        }
        Integer instituteId = institute.getId();
        Application application = new Application();
        application.setUserId(userId);
        application.setInstituteId(instituteId);
        application.setTitle(title);
        application.setIdentity(identity);
        applicationService.insertApplication(application);
        map.put("info", "申请已发送");
        return map;
    }
}