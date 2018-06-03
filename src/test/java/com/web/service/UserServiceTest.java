package com.web.service;

import com.web.bean.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:MyBatis-config.xml"})
public class UserServiceTest {
    @Autowired
    private UserService userService;

    @Test
    public void userExist() {
        assertFalse(userService.userExist(-1));
        assertTrue(userService.userExist(1));
    }

    @Test
    public void insertUser() {
        String a = "1";
        String b = new String("1");
        System.out.println(a.equals(b));
    }
}