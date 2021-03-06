package com.web.service;

import com.web.bean.User;
import com.web.dao.UserMapper;
import com.web.utils.Setting;
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

    public String selectPassword(String username){
        String password = userMapper.selectPasswordByUsername(username);
        return password;
    }

    public void updateExp(User user){
        userMapper.updateExpByUser(user);
    }

    public void updateDegree(User user){
        userMapper.updateDegreeByUser(user);
    }

    public int selectExp(String username){
        int exp = userMapper.selectExpByUsername(username);
        return exp;
    }

    public User getUser(String username){
        return userMapper.selectByName(username);
    }

    public User getUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public void updateExpAndDegree(String userName, int expAdd){
        int exp = selectExp(userName);
        int expNew = exp + expAdd;
        if(expNew >= Setting.DEGREE_EXP) {
            User user = new User(userName, null, null, 0, 0, null, expNew - Setting.DEGREE_EXP);
            updateExp(user);
            updateDegree(user);
        }else{
            User user = new User(userName, null, null, 0, 0, null, expNew);
            updateExp(user);
        }
    }

    public void updateEmail(User user){
        userMapper.updateByPrimaryKey(user);
    }

    public void updatePhone(User user) { userMapper.updateByPrimaryKey(user); }

    public void updatePw(User user) { userMapper.updateByPrimaryKey(user); }

    public void updateUserName(User user) { userMapper.updateByPrimaryKey(user); }

    public void updateUser(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    public void updateCredit(User user){
        userMapper.updateByPrimaryKey(user);
    }
}
