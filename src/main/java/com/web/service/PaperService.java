package com.web.service;

import com.web.bean.Discipline;
import com.web.bean.Paper;
import com.web.bean.PaperExample;
import com.web.dao.PaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public Paper selectByName(String name) {
        return paperMapper.selectByName(name);
    }

    public boolean paperExist(Integer id) {
        return null != paperMapper.selectByPrimaryKey(id);
    }

    public void deletePaper(Integer id) {
        paperMapper.deleteByPrimaryKey(id);
    }

    public int insertPaper(Paper paper) {
        return paperMapper.insertSelective(paper);
    }

    public List<Paper> selectByDiscipline(Integer disciplineId) {
        return paperMapper.selectByDiscipline(disciplineId);
    }
}