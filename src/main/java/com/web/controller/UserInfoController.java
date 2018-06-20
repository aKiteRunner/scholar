package com.web.controller;

import com.web.bean.User;
import com.web.service.UserService;
import com.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserInfoController {
    private final UserService userService;

    @Autowired
    public UserInfoController(UserService userService){
        this.userService = userService;
    }

    @RequestMapping(value = "setting/userInfo", method = RequestMethod.GET)
    public String userInfo(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
//        if(session.getAttribute("logined") != null){
//            model.addAttribute("errorInfo", "您还未登录");
//            return "index";
//        }else {
//            String username = (String) session.getAttribute("username");
        String username = "abc123";
            User user = userService.getUser(username);
            String email = user.getEmail();
            String phone = user.getPhone();
            int credit = user.getCredit();
            int degree = user.getDegree();
            int exp = user.getExp();
            model.addAttribute("username", username);
            model.addAttribute("email", email);
            model.addAttribute("phone", phone);
            model.addAttribute("credit", credit);
            model.addAttribute("degree", degree);
            model.addAttribute("exp", Setting.DEGREE_EXP - exp);
            return "userInfo";
//        }
    }
}
