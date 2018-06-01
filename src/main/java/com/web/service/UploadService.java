package com.web.service;

import com.web.bean.Paper;
import com.web.dao.PaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UploadService {
    private final PaperMapper paperMapper;

    @Autowired
    public UploadService(PaperMapper paperMapper) {
        this.paperMapper = paperMapper;
    }

    public void insertPaper(Paper paper) {
        paperMapper.insertSelective(paper);
    }
}
