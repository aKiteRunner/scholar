package com.web.service;

import com.web.bean.Discipline;
import com.web.bean.Paper;
import com.web.bean.PaperExample;
import com.web.bean.PaperForSearch;
import com.web.dao.PaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    public List<PaperForSearch> selectPaperForSearch(){
        List<Paper> list = paperMapper.selectPaperForSearch();
        List<PaperForSearch> pfsList = new ArrayList<>();
        for(int i = 0; i <list.size(); i++ ){
            int id = list.get(i).getId();
            String name = list.get(i).getName();
            double popularity = list.get(i).getPopularity();
            String abstract1 = list.get(i).getAbstract1();
            PaperForSearch pfs = new PaperForSearch(id, name, popularity, abstract1);
            pfsList.add(pfs);
        }
        return pfsList;
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

    public void addPopularity(Integer paperId, Double popularity) {
        Paper paper = paperMapper.selectByPrimaryKey(paperId);
        paper.setPopularity(paper.getPopularity() + popularity);
        paperMapper.updateByPrimaryKey(paper);
    }
}
