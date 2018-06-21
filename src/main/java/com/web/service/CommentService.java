package com.web.service;

import com.web.bean.Comment;
import com.web.dao.CommentMapper;
import com.web.exception.ParameterInvalidException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CommentService {
    private final CommentMapper commentMapper;
    private final PaperService paperService;

    @Autowired
    public CommentService(CommentMapper commentMapper, PaperService paperService) {
        this.commentMapper = commentMapper;
        this.paperService = paperService;
    }

    public List<Comment> paperComment(Integer paperId) {
        return commentMapper.selectByPaper(paperId);
    }

    public void addComment(Integer userId, Integer paperId, String content) throws ParameterInvalidException {
        if (!paperService.paperExist(paperId)) {
            throw new ParameterInvalidException("该文献不存在");
        }
        if (content == null || content.trim().equals("")) {
            throw new ParameterInvalidException("评论不能为空");
        }
        Comment comment = new Comment();
        comment.setUserId(userId);
        comment.setPaperId(paperId);
        comment.setComment(content);
        comment.setTime(new Date());
        commentMapper.insert(comment);
    }

    public List<Comment> allPaperComment(Integer paperId) {
        return commentMapper.selectByPaper(paperId);
    }
}
