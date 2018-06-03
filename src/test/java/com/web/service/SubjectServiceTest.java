package com.web.service;

import com.web.bean.Subject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.jws.Oneway;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:MyBatis-config.xml"})
public class SubjectServiceTest {
    @Autowired
    private SubjectService subjectService;

    @Test
    public void subjectExist() {
        assertFalse(subjectService.subjectExist("哈哈"));
        assertTrue(subjectService.subjectExist("其他"));
        assertFalse(subjectService.subjectExist(0));
        assertTrue(subjectService.subjectExist(1));
    }
}