package com.web.service;

import com.web.bean.Discipline;
import com.web.bean.Paper;
import com.web.bean.PaperExample;
import com.web.bean.PaperForSearch;
import com.web.bean.PaperForSearch;
import com.web.dao.PaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class PaperService {
    private final PaperMapper paperMapper;
    private final ScholarPaperService scholarPaperService;
    private final ScholarService scholarService;

    @Autowired
    public PaperService(PaperMapper paperMapper, ScholarPaperService scholarPaperService, ScholarService scholarService) {
        this.paperMapper = paperMapper;
        this.scholarPaperService = scholarPaperService;
        this.scholarService = scholarService;
    }

    public Paper selectById(Integer id) {
        return paperMapper.selectByPrimaryKey(id);
    }

    public List<PaperForSearch> selectPaperForSearch(){
        List<Paper> list = paperMapper.selectPaperForSearch();
        List<PaperForSearch> pfsList = new ArrayList<>();
        for(int i = 0; i <list.size(); i++ ){
            int id = list.get(i).getId();
            String name = list.get(i).getName();
            double popularity = list.get(i).getPopularity();
            String abstract1 = list.get(i).getAbstract1();
            int scholarId = scholarPaperService.getScholarId(id);
            String scholarname = scholarService.getName(scholarId);
            Date time = list.get(i).getTime();
            PaperForSearch pfs = new PaperForSearch(id, name, popularity, abstract1, scholarname, time);
            pfsList.add(pfs);
        }
        return pfsList;
    }

    public Paper selectByName(String name) {
        return paperMapper.selectByName(name);
    }

    public List<Paper> mostPopularPaper(Integer number) {
        return paperMapper.orderByDescendingPopularity(number);
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

    public List<Paper> selectByInstitute(Integer instituteId) {
        return paperMapper.selectByInstitute(instituteId);
    }

    public List<Paper> selectByUser(Integer userId) {
        return paperMapper.selectByUser(userId);
    }

    public void addPopularity(Integer paperId, Double popularity) {
        Paper paper = paperMapper.selectByPrimaryKey(paperId);
        paper.setPopularity(paper.getPopularity() + popularity);
        paperMapper.updateByPrimaryKey(paper);
    }

    public void updatePrice(Integer paperId, Integer price) {
        Paper paper = selectById(paperId);
        paper.setPrice(price);
        paperMapper.updateByPrimaryKey(paper);
    }
}
