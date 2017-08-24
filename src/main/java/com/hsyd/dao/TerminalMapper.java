package com.hsyd.dao;

import com.hsyd.model.SearchModel;
import com.hsyd.model.Terminal;
import com.hsyd.utils.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by vie1224 on 2017/8/22.
 */
@Repository
public interface TerminalMapper {

    //查询总数
    int selectTotal(@Param("uuid") String uuid);

    //查询终端列表
    List<Terminal> selectMonitorInfo(PageUtil pageUtil);

    //查询详情
    List<SearchModel> selectMonitorDetail(String uuid);

    //修改终端
    void updateTerminal(Terminal terminal);

    //新增终端
    void insertTerminal(Terminal terminal);

    void deleteTerminal(String uuid);
}
