package com.web.controller;

import com.web.bean.Comment;
import com.web.bean.Paper;
import com.web.exception.ParameterInvalidException;
import com.web.service.CommentService;
import com.web.service.PaperService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class CommentController {
    private final CommentService commentService;
    private final PaperService paperService;

    @Autowired
    public CommentController(CommentService commentService, PaperService paperService) {
        this.commentService = commentService;
        this.paperService = paperService;
    }

    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> comment(HttpSession session,
                                           @RequestBody String json) {
        // 检查登录
        HashMap<String, String> map = new HashMap<>();
        JSONObject jsonObject = new JSONObject(json);
        int paperId = jsonObject.getInt("paperId");
        String content = jsonObject.getString("content");
        if (session.getAttribute("logined")== null) {
            map.put("errorInfo", "请登录");
            return map;
        }
        Integer userId = (Integer) session.getAttribute("id");
        try {
            commentService.addComment(userId, paperId, content);
            map.put("info", "评论成功");
        } catch (ParameterInvalidException e) {
            map.put("errorInfo", e.getMessage());
        }
        System.out.println("!");
        return map;
    }
}
