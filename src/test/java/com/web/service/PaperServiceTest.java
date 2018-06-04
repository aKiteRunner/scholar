package com.web.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:MyBatis-config.xml"})
public class PaperServiceTest {
    @Autowired
    private PaperService paperService;

    @Test
    public void selectByDiscipline() {
        assertNotNull(paperService.selectByDiscipline(1));
    }
}