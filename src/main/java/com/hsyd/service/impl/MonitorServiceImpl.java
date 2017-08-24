package com.hsyd.service.impl;

import com.hsyd.dao.TerminalMapper;
import com.hsyd.model.SearchModel;
import com.hsyd.model.Terminal;
import com.hsyd.service.MonitorService;
import com.hsyd.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by vie1224 on 2017/8/22.
 */
@Service
public class MonitorServiceImpl implements MonitorService {

    @Autowired
    private TerminalMapper terminalMapper;

    @Override
    public PageUtil selectMonitorInfo(Integer pageIndex, Integer pageSize, String uuid) {

        List<Terminal> terminalList = new ArrayList<>();
        PageUtil pageUtil = new PageUtil();
        try {
            pageUtil.setPageSize(pageSize);
            int rows = terminalMapper.selectTotal(uuid);
            pageUtil.setRows(rows);
            pageUtil.setPageIndex(pageIndex);
            pageUtil.setUuid(uuid);
            terminalList = terminalMapper.selectMonitorInfo(pageUtil);
            pageUtil.setResultList(terminalList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return pageUtil;
    }

    @Override
    public List<SearchModel> selectMonitorDetail(String uuid) {

        return terminalMapper.selectMonitorDetail(uuid);
    }
}
