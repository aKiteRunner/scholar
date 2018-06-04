package com.web.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:MyBatis-config.xml"})
public class UserPaperServiceTest {
    @Autowired
    private UserPaperService userPaperService;

    @Test
    public void paperAccessible() {
        assertTrue(userPaperService.paperAccessible(1, 4));
        assertFalse(userPaperService.paperAccessible(1, -1));
    }
}