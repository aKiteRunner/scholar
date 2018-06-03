package com.web.controller;

import com.web.bean.User;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RegistController {
    private final UserService userService;

    @Autowired
    public RegistController(UserService userService){
        this.userService = userService;
    }

    @ResponseBody
    @RequestMapping(value = "/regist", method = RequestMethod.POST)
 //   {username}/{password1}/{password2}/{email}/{degree}/{credit}/{phone}/{exp}


    public String Regist(@RequestParam(value = "userName") String userName, @RequestParam(value = "password1") String password1,
                         @RequestParam(value = "password2") String password2, @RequestParam(value = "email") String email,
                         @RequestParam(value = "phone") String phone, Model model){
        //userService.insertUser(new User("2", "1", "1", 1,11, "1", 1));
        if(userService.userExist(userName)) {
            //System.out.print("1");
            model.addAttribute("errorInfo", "用户名已存在");
        }else if(!userName.matches("^[0-9a-zA-Z]{6,12}$")){
            model.addAttribute("errorInfo", "用户名需由字母或数字组成且位数不多于12位不少于6位");
        }else if(password1.length() < 8 || userName.length() > 16){
            model.addAttribute("errorInfo", "密码的长度不多于16位不少于8位");
        }else if(password2.equals(password1)){
            model.addAttribute("errorInfo", "两次输入的密码不一致");
        }else if(!email.matches("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$")){
            model.addAttribute("errorInfo", "输入的邮箱的不合法");
        }else if(phone.length() != 11){
            model.addAttribute("errorInfo", "手机号不正确");
        }else{
            userService.insertUser(new User(userName, password1, email, 0, 0, phone, 0));
            model.addAttribute("info", "操作成功");
            return "login";
        }

//      public String Regist(@PathVariable(value = "userName") String userName, Model model){
//           System.out.print(userName.matches("^[0-9a-zA-Z]{6,12}$"));

//    if(userService.userExist())
//    }

            return "regist";
    }
}
