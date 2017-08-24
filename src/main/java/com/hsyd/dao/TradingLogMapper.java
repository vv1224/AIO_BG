package com.hsyd.dao;

import com.hsyd.model.TradingLog;
import com.hsyd.utils.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by vie1224 on 2017/8/23.
 */
@Repository
public interface TradingLogMapper {

    //查询总记录数
    int selectTotal(PageUtil pageUtil);

    //交易记录查询
    List<TradingLog> selectTradingLogList(PageUtil pageUtil);


}
