package com.web.controller;

import com.web.bean.Comment;
import com.web.exception.ParameterInvalidException;
import com.web.service.CommentService;
import com.web.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;

@Controller
public class CommentController {
    private final CommentService commentService;
    private final PaperService paperService;

    @Autowired
    public CommentController(CommentService commentService, PaperService paperService) {
        this.commentService = commentService;
        this.paperService = paperService;
    }

    @RequestMapping(value = "comment", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> comment(HttpSession session,
                                           @RequestParam("paperId") Integer paperId,
                                           @RequestParam("content") String content) {
        // 检查登录
        Integer userId = (Integer) session.getAttribute("id");
        HashMap<String, String> map = new HashMap<>();
        try {
            commentService.addComment(userId, paperId, content);
            map.put("info", "评论成功");
        } catch (ParameterInvalidException e) {
            map.put("errorInfo", e.getMessage());
        }
        return map;
    }
}
