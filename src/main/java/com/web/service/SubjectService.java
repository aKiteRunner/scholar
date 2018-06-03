package com.web.service;

import com.web.bean.Subject;
import com.web.bean.SubjectExample;
import com.web.dao.SubjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubjectService {
    private final SubjectMapper subjectMapper;

    @Autowired
    public SubjectService(SubjectMapper subjectMapper) {
        this.subjectMapper = subjectMapper;
    }

    public boolean subjectExist(String name) {
        return null != subjectMapper.selectByName(name);
    }

    public boolean subjectExist(Integer id) {
        return null != subjectMapper.selectByPrimaryKey(id);
    }

    public Subject selectByName(String name) {
        return subjectMapper.selectByName(name);
    }

    public Subject selectById(Integer id) {
        return subjectMapper.selectByPrimaryKey(id);
    }
}
