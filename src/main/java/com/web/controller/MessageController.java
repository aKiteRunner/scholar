package com.web.controller;

import com.web.bean.Message;
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

    @Autowired
    public MessageController(MessageService messageService, UserService userService) {
        this.messageService = messageService;
        this.userService = userService;
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
        // 按照时间倒序排列，并都标记为已读
        sentMessage.forEach((Message m) -> {
            messageService.checkMessage(m.getId());
        });
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
        // 按照时间倒序排列，并都标记为已读
        receivedMessage.forEach((Message m) -> {
            messageService.checkMessage(m.getId());
        });
        receivedMessage = receivedMessage.parallelStream().
                sorted(Comparator.comparing(Message::getSendTime).reversed()).
                collect(Collectors.toList());
        map.put("sentMessage", receivedMessage);
        return map;
    }

    @RequestMapping(value = "/setting/sendmessage", method = RequestMethod.POST)
    @ResponseBody
    // JSON中传receiverId, senderId, content
    public HashMap<String, String> sendMessage(@RequestBody String json, HttpSession session) {
        // 先登录
        if (session.getAttribute("logined") == null) {
            return null;
        }
        Integer userId = (Integer) session.getAttribute("id");
        HashMap<String, String> map = new HashMap<>();
        JSONObject jsonObject = new JSONObject(json);
        Integer receiverId = jsonObject.getInt("receiverId");
        if (!userService.userExist(receiverId)) {
            map.put("errorInfo", "用户不存在");
            return map;
        }
        String content = jsonObject.getString("content");
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
}
