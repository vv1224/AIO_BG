package com.hsyd.dao;

import com.hsyd.model.StatisticalManagement;
import com.hsyd.utils.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by vie1224 on 2017/8/25.
 */
@Repository
public interface StatisticalManagementMapper {

    int selectTotal();

   // List<StatisticalManagement> select(PageUtil pageUtil, @Param("startTime") String startTime,@Param("endTime") String endTime);
   List<StatisticalManagement> select(PageUtil pageUtil);
}
