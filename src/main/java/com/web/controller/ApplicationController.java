package com.web.controller;

import com.web.bean.Application;
import com.web.service.ApplicationService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class ApplicationController {
    private final ApplicationService applicationService;

    @Autowired
    public ApplicationController(ApplicationService applicationService){
        this.applicationService = applicationService;
    }

    @ResponseBody
    @RequestMapping(value = "/apply", method = RequestMethod.POST)
    public HashMap<String, Object> apply(@RequestBody String json, HttpSession httpSession){
        HashMap<String, Object>map = new HashMap<>();
        JSONObject jsonObject = new JSONObject(json);
        String identity = jsonObject.getString("identity");
        String title = jsonObject.getString("title");
        int instituteId = jsonObject.getInt("instituteId");
        int userId = (int)httpSession.getAttribute("id");
        applicationService.insertApplication(new Application(userId, instituteId, title, identity));
        map.put("info", "您已成功发送申请");
        return map;
    }

}
