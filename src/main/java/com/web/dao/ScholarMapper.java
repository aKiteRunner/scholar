package com.web.dao;

import com.web.bean.Scholar;
import com.web.bean.ScholarExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ScholarMapper {
    long countByExample(ScholarExample example);

    int deleteByExample(ScholarExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Scholar record);

    int insertSelective(Scholar record);

    List<Scholar> selectByExample(ScholarExample example);

    Scholar selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Scholar record, @Param("example") ScholarExample example);

    int updateByExample(@Param("record") Scholar record, @Param("example") ScholarExample example);

    int updateByPrimaryKeySelective(Scholar record);

    int updateByPrimaryKey(Scholar record);
}