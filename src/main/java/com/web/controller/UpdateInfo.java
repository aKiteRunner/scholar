package com.web.controller;

import com.web.bean.User;
import com.web.service.UserService;
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
public class UpdateInfo {
    private final UserService userService;

    @Autowired
    public UpdateInfo(UserService userService){
        this.userService = userService;
    }

    @ResponseBody
    @RequestMapping(value = "/setting/updateInfo", method = RequestMethod.GET)
    public String updateInfo(){
        
    }

    @ResponseBody
    @RequestMapping(value = "/unCh", method = RequestMethod.GET)
    public String changeUserName(){
        return "";
    }
    @ResponseBody
    @RequestMapping(value = "/pwCh", method = RequestMethod.GET)
    public String changePassword(){
        return "";
    }
    @ResponseBody
    @RequestMapping(value = "/phCh", method = RequestMethod.GET)
    public String changePhone(){
        return "";
    }
    @ResponseBody
    @RequestMapping(value = "/emCh", method = RequestMethod.GET)
    public String changeEmail(HttpServletRequest request, @RequestParam(value = "email") String email, Model model){
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        if(!email.matches("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$")) {
            model.addAttribute("errorInfo", "输入的邮箱的不合法");
        }else{
            User user = userService.getUser(username);
            user.setEmail(email);
            userService.updateEmail(user);
            model.addAttribute("info", "修改成功");
        }
        return "userinfo";
    }
}
