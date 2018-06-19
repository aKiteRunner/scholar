package com.web.dao;

import com.web.bean.ScholarPaper;
import com.web.bean.ScholarPaperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ScholarPaperMapper {
    long countByExample(ScholarPaperExample example);

    int deleteByExample(ScholarPaperExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ScholarPaper record);

    int insertSelective(ScholarPaper record);

    List<ScholarPaper> selectByExample(ScholarPaperExample example);

    ScholarPaper selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ScholarPaper record, @Param("example") ScholarPaperExample example);

    int updateByExample(@Param("record") ScholarPaper record, @Param("example") ScholarPaperExample example);

    int updateByPrimaryKeySelective(ScholarPaper record);

    int updateByPrimaryKey(ScholarPaper record);

    ScholarPaper selectByScholarAndPaper(@Param("scholarId") Integer scholarId,@Param("paperId") Integer paperId);

    //xml没写
    int selectByPaper(Integer paperId);
}