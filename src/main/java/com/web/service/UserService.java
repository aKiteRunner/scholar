package com.web.service;

import com.web.bean.User;
import com.web.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// 用户有关操作
@Service
public class UserService {
    private final UserMapper userMapper;

    @Autowired
    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public boolean userExist(Integer userId) {
        User user = userMapper.selectByPrimaryKey(userId);
        return user != null;
    }

    public void insertUser(User user){
        userMapper.insert(user);
    }

    public boolean  userExist(String username){
        User user = userMapper.selectByName(username);
        return user != null;
    }
}
