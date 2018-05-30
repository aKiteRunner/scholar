package com.web.dao;

import com.web.bean.UserPaper;
import com.web.bean.UserPaperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserPaperMapper {
    long countByExample(UserPaperExample example);

    int deleteByExample(UserPaperExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserPaper record);

    int insertSelective(UserPaper record);

    List<UserPaper> selectByExample(UserPaperExample example);

    UserPaper selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserPaper record, @Param("example") UserPaperExample example);

    int updateByExample(@Param("record") UserPaper record, @Param("example") UserPaperExample example);

    int updateByPrimaryKeySelective(UserPaper record);

    int updateByPrimaryKey(UserPaper record);
}