package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LogoutController {


    @ResponseBody
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String login(HttpServletRequest request, Model model) {
        //session
        HttpSession session = request.getSession(true);
        if (session.getAttribute("logined") != null) {
            session.removeAttribute("logined");
            model.addAttribute("Info", "注销成功");
            return "index";
        } else {
            return "login";
        }

    }
}
