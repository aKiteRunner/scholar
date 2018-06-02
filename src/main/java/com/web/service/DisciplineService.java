package com.web.service;

import com.web.bean.Discipline;
import com.web.dao.DisciplineMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DisciplineService {
    private final DisciplineMapper disciplineMapper;

    @Autowired
    public DisciplineService(DisciplineMapper disciplineMapper) {
        this.disciplineMapper = disciplineMapper;
    }

    public boolean disciplineExist(String name) {
        return null != disciplineMapper.selectByName(name);
    }

    public boolean disciplineExist(Integer id) {
        return null != disciplineMapper.selectByPrimaryKey(id);
    }

    public Discipline selectByName(String name) {
        return disciplineMapper.selectByName(name);
    }

    public Discipline selectById(Integer id) {
        return disciplineMapper.selectByPrimaryKey(id);
    }
}
