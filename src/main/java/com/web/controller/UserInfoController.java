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
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserInfoController {
    private final UserService userService;

    @Autowired
    public UserInfoController(UserService userService){
        this.userService = userService;
    }

    @RequestMapping(value = "/setting", method = RequestMethod.GET)
    public String setting(HttpSession session, Model model){
        if(session.getAttribute("logined") == null){
            model.addAttribute("errorInfo", "您还未登录");
            return "redirect:/login";
        }
        Integer userId = (Integer) session.getAttribute("id");
        User user = userService.getUser(userId);
        String email = user.getEmail();
        String phone = user.getPhone();
        int credit = user.getCredit();
        int degree = user.getDegree();
        int exp = user.getExp();
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", email);
        model.addAttribute("phone", phone);
        model.addAttribute("credit", credit);
        model.addAttribute("degree", degree);
        model.addAttribute("exp", exp);
        model.addAttribute("maxExp", Setting.DEGREE_EXP);
        return "userInfo";
    }

    @ResponseBody
    @RequestMapping(value = "/setting/userInfo", method = RequestMethod.GET)
    public Map<String, Object> userInfo(HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();
        if(session.getAttribute("logined") == null){
            map.put("errorInfo", "您还未登录");
            return map;
        }
        Integer userId = (Integer) session.getAttribute("id");
        User user = userService.getUser(userId);
        String email = user.getEmail();
        String phone = user.getPhone();
        int credit = user.getCredit();
        int degree = user.getDegree();
        int exp = user.getExp();
        map.put("username", user.getUsername());
        map.put("email", email);
        map.put("phone", phone);
        map.put("credit", credit);
        map.put("degree", degree);
        map.put("maxExp", Setting.DEGREE_EXP);
        map.put("exp", exp);
        return map;
    }
}
