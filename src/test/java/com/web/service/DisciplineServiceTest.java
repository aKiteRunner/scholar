package com.web.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:MyBatis-config.xml"})
public class DisciplineServiceTest {
    @Autowired
    private DisciplineService disciplineService;

    @Test
    public void disciplineExist() {
        assertFalse(disciplineService.disciplineExist("哈哈"));
        assertTrue(disciplineService.disciplineExist("其他"));
        assertFalse(disciplineService.disciplineExist(0));
        assertTrue(disciplineService.disciplineExist(1));
    }
}