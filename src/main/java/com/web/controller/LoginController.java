package com.web.controller;


import com.web.bean.User;
import com.web.service.UserService;
import com.web.utils.Md5;
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
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

@Controller
public class LoginController {
    private final UserService userService;

    @Autowired
    public LoginController(UserService userService){
        this.userService = userService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGet(){
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, @RequestParam(value = "userName") String userName, @RequestParam(value = "password") String password, Model model) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        if(!userService.userExist(userName)){
            model.addAttribute("errorInfo", "用户名或密码不正确");
        }else{
            String rightPassword = userService.selectPassword(userName);
            if(!Md5.checkpassword(password, rightPassword)){
                model.addAttribute("errorInfo", "用户名或密码不正确");
            }else{
                //没写专家情况
                userService.updateExpAndDegree(userName, Setting.LOGIN_EXP);
                //session
                HttpSession session = request.getSession(true);
                session.setAttribute("logined", "success");
                session.setAttribute("username", userName);
                session.setAttribute("id", userService.getUser(userName).getId());
                model.addAttribute("Info", "操作成功");
                return "index";
            }
        }
        return "login";
    }
//    public String login(){
//        String userName = "1";
//        int exp = userService.selectExp(userName);
//        if(exp + Setting.LOGIN_EXP == 100) {
//            User user = new User(userName, null, null, 0, 0, null, 0);
//            userService.updateExp(user);
//            userService.updateDegree(user);
//        }else{
//            User user = new User(userName, null, null, 0, 0, null, exp + Setting.LOGIN_EXP);
//            userService.updateExp(user);
//        }
//        return "";
//    }

}
