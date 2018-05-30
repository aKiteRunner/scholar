package com.web.dao;

import com.web.bean.PaperOrder;
import com.web.bean.PaperOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PaperOrderMapper {
    long countByExample(PaperOrderExample example);

    int deleteByExample(PaperOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PaperOrder record);

    int insertSelective(PaperOrder record);

    List<PaperOrder> selectByExample(PaperOrderExample example);

    PaperOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PaperOrder record, @Param("example") PaperOrderExample example);

    int updateByExample(@Param("record") PaperOrder record, @Param("example") PaperOrderExample example);

    int updateByPrimaryKeySelective(PaperOrder record);

    int updateByPrimaryKey(PaperOrder record);
}