package com.web.controller;

import com.web.bean.User;
import com.web.service.UserService;
import com.web.utils.Md5;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

@Controller
public class UpdateInfo {
    private final UserService userService;

    @Autowired
    public UpdateInfo(UserService userService){
        this.userService = userService;
    }

    @ResponseBody
    @RequestMapping(value = "/setting/updateInfo", method = RequestMethod.GET)
    public HashMap<String, Object> updateInfo(@RequestBody String json, HttpSession session){
        HashMap<String, Object> map = new HashMap<String, Object>();
        // 先登录
        if (session.getAttribute("logined") == null) {
            return null;
        }else{
            JSONObject jsonObject = new JSONObject(json);
            String username = (String) session.getAttribute("username");
            User user = userService.getUser(username);
            String email = user.getEmail();
            String phone = user.getPhone();
            int credit = user.getCredit();
            int degree = user.getDegree();
            int exp = user.getExp();
            map.put("username", username);
            map.put("email", email);
            map.put("phone", phone);
            map.put("credit", credit);
            map.put("degree", degree);
            map.put("exp", exp);
        }
        return  map;
    }

    //改用户名
    @ResponseBody
    @RequestMapping(value = "/setting/unCh", method = RequestMethod.POST)
    public HashMap<String, Object> changeUserName(@RequestBody String json, HttpServletRequest request){
        HashMap<String, Object>map = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        int id = (Integer) session.getAttribute("id");
        User user = userService.getUser(id);
        JSONObject jsonObject = new JSONObject(json);
        String username = jsonObject.getString("username");
        if(!username.matches("^[0-9a-zA-Z]{6,12}$")){
            map.put("errorInfo", "用户名需由字母或数字组成且位数不多于12位不少于6位");
        }else{
            user.setUsername(username);
            userService.updateUserName(user);
            session.setAttribute("username", username);
            map.put("username", username);
            map.put("info", "修改用户名成功");
        }
        return map;
    }

    //修改密码
    @ResponseBody
    @RequestMapping(value = "/setting/pwCh", method = RequestMethod.POST)
    public HashMap<String, Object> changePw(@RequestBody String json, HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        HashMap<String, Object>map = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        User user = userService.getUser(username);
        JSONObject jsonObject = new JSONObject(json);
        String oldPw = jsonObject.getString("oldPw");
        String newPw = jsonObject.getString("newPw");
        String newPwConf = jsonObject.getString("newPwConf");
        String rightPw = user.getPassword();
        String encodeedPassword = "";
        if(!Md5.checkpassword(oldPw, rightPw)){
            map.put("errorInfo", "原密码输入错误");
        }else if(newPw.length() < 8 || newPw.length() > 16){
            map.put("errorInfo", "新密码长度不合规范");
        }else if(!newPw.equals(newPwConf)) {
            map.put("errorInfo", "两次输入的密码不一致");
        }else{
            try{
                encodeedPassword = Md5.EncoderByMd5(newPw);
//                System.out.println(encodeedPassword);
            }catch (NoSuchAlgorithmException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            user.setPassword(encodeedPassword);
            userService.updatePw(user);
            map.put("info", "修改密码成功");
        }
        return map;
    }

    //修改电话
    @ResponseBody
    @RequestMapping(value = "/setting/phCh", method = RequestMethod.POST)
    public HashMap<String, Object> changePhone(@RequestBody String json, HttpServletRequest request){
        HashMap<String, Object>map = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        JSONObject jsonObject = new JSONObject(json);
        String phone = jsonObject.getString("phone");
        if(phone.length() != 9) {
            map.put("errorInfo", "手机号不正确");
        }else{
            User user = userService.getUser(username);
            user.setPhone(phone);
            userService.updatePhone(user);
            map.put("phone", phone);
            map.put("info", "修改手机号成功");
        }
        return map;
    }


    //修改邮箱
    @ResponseBody
    @RequestMapping(value = "/setting/emCh", method = RequestMethod.POST)
    public HashMap<String, Object> changeEmail(@RequestBody String json, HttpServletRequest request){
        HashMap<String, Object>map = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        JSONObject jsonObject = new JSONObject(json);
        String email = jsonObject.getString("email");
        if(!email.matches("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$")) {
           map.put("errorInfo", "邮箱输入不合法");
        }else{
            User user = userService.getUser(username);
            user.setEmail(email);
            userService.updateEmail(user);
            map.put("email", email);
            map.put("info", "修改邮箱成功");
        }
        return map;
    }
}
