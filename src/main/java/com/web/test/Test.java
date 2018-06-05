package com.web.test;

import com.web.bean.User;
import com.web.dao.UserMapper;
import com.web.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.swing.*;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Test {
    @Autowired
    UserMapper userMapper;

    @Autowired
    SqlSession sqlSession;

    @org.junit.Test
    public void test(){
        userMapper.insertSelective(new User( "1", "1", "1", 1, 1, "1", 1));
    }
    public static void main(String[] args) {
        List<Date> list = Arrays.asList(new Date(), new Date());
        list = list.stream().sorted(Date::compareTo).collect(Collectors.toList());
        System.out.println(list);
    }
}
