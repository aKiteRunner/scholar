package com.web.service;

import com.web.bean.UserPaper;
import com.web.dao.UserPaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserPaperService {
    private final UserPaperMapper userPaperMapper;

    @Autowired
    public UserPaperService(UserPaperMapper userPaperMapper) {
        this.userPaperMapper = userPaperMapper;
    }

    public int insertUserPaper(UserPaper userPaper) {
        return userPaperMapper.insert(userPaper);
    }

    public boolean paperAccessible(Integer userId, Integer paperId) {
        return null != userPaperMapper.selectByUserAndPaper(userId, paperId);
    }
}
