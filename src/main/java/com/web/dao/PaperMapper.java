package com.web.dao;

import com.web.bean.Paper;
import com.web.bean.PaperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PaperMapper {
    long countByExample(PaperExample example);

    int deleteByExample(PaperExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Paper record);

    int insertSelective(Paper record);

    List<Paper> selectByExample(PaperExample example);

    List<Paper> orderByDescendingPopularity(Integer number);

    Paper selectByPrimaryKey(Integer id);

    Paper selectByName(String name);

    List<Paper> selectByDiscipline(Integer disciplineId);

    List<Paper> selectByUser(Integer userId);

    List<Paper> selectByInstitute(Integer InstituteId);

    int updateByExampleSelective(@Param("record") Paper record, @Param("example") PaperExample example);

    int updateByExample(@Param("record") Paper record, @Param("example") PaperExample example);

    int updateByPrimaryKeySelective(Paper record);

    int updateByPrimaryKey(Paper record);

    //elastic
    List<Paper> selectPaperForSearch();
}