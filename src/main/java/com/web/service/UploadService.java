package com.web.service;

import com.web.bean.Paper;
import com.web.bean.ScholarPaper;
import com.web.dao.PaperMapper;
import com.web.dao.ScholarPaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UploadService {
    private final PaperMapper paperMapper;
    private final ScholarPaperMapper scholarPaperMapper;

    @Autowired
    public UploadService(PaperMapper paperMapper, ScholarPaperMapper scholarPaperMapper) {
        this.paperMapper = paperMapper;
        this.scholarPaperMapper = scholarPaperMapper;
    }

    public int insertPaper(Paper paper) {
        return paperMapper.insertSelective(paper);
    }

    public int insertScholarPaper(ScholarPaper scholarPaper) {
        return scholarPaperMapper.insert(scholarPaper);
    }
}
