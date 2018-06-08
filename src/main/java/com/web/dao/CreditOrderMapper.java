package com.web.dao;

import com.web.bean.CreditOrder;
import com.web.bean.CreditOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CreditOrderMapper {
    long countByExample(CreditOrderExample example);

    int deleteByExample(CreditOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CreditOrder record);

    int insertSelective(CreditOrder record);

    List<CreditOrder> selectByExample(CreditOrderExample example);

    CreditOrder selectByPrimaryKey(Integer id);

    List<CreditOrder> selectByUser(Integer userId);

    int updateByExampleSelective(@Param("record") CreditOrder record, @Param("example") CreditOrderExample example);

    int updateByExample(@Param("record") CreditOrder record, @Param("example") CreditOrderExample example);

    int updateByPrimaryKeySelective(CreditOrder record);

    int updateByPrimaryKey(CreditOrder record);
}