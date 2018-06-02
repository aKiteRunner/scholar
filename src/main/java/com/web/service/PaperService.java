package com.web.service;

import com.web.bean.Paper;
import com.web.dao.PaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaperService {
    private final PaperMapper paperMapper;

    @Autowired
    public PaperService(PaperMapper paperMapper) {
        this.paperMapper = paperMapper;
    }

    public Paper selectById(Integer id) {
        return paperMapper.selectByPrimaryKey(id);
    }

    public Integer selectLastInsertID() {
        return paperMapper.selectLastInsertID();
    }

    public Paper selectByName(String name) {
        return paperMapper.selectByName(name);
    }
}
