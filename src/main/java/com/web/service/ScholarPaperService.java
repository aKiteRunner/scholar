package com.web.service;

import com.web.bean.ScholarPaper;
import com.web.dao.ScholarPaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScholarPaperService {
    private final ScholarPaperMapper scholarPaperMapper;

    @Autowired
    public ScholarPaperService(ScholarPaperMapper scholarPaperMapper) {
        this.scholarPaperMapper = scholarPaperMapper;
    }

    public int insertScholarPaper(ScholarPaper scholarPaper) {
        return scholarPaperMapper.insert(scholarPaper);
    }

    public boolean paperAccessible(Integer scholarId, Integer paperId) {
        return null != scholarPaperMapper.selectByScholarAndPaper(scholarId, paperId);
    }

    public int getScholarId(Integer paperId){
        // !!!
        int scholarId = 11;
        try {
            scholarId = scholarPaperMapper.selectByPaper(paperId);
        } catch (NullPointerException e) {
            System.out.println("!!!!!!" + paperId);
            throw e;
        }
        return scholarId;
    }
}
