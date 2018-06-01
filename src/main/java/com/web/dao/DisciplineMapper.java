package com.web.dao;

import com.web.bean.Discipline;
import com.web.bean.DisciplineExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DisciplineMapper {
    long countByExample(DisciplineExample example);

    int deleteByExample(DisciplineExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Discipline record);

    int insertSelective(Discipline record);

    List<Discipline> selectByExample(DisciplineExample example);

    Discipline selectByPrimaryKey(Integer id);

    Discipline selectByName(String name);

    int updateByExampleSelective(@Param("record") Discipline record, @Param("example") DisciplineExample example);

    int updateByExample(@Param("record") Discipline record, @Param("example") DisciplineExample example);

    int updateByPrimaryKeySelective(Discipline record);

    int updateByPrimaryKey(Discipline record);
}