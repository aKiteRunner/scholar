package com.web.service;

import com.web.dao.ScholarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScholarService {
    private final ScholarMapper scholarMapper;

    @Autowired
    public ScholarService(ScholarMapper scholarMapper) {
        this.scholarMapper = scholarMapper;
    }

    public boolean scholarExist(Integer id) {
        return null != scholarMapper.selectByPrimaryKey(id);
    }
}
