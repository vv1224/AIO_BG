package com.hsyd.service;

import com.hsyd.utils.PageUtil;

/**
 * Created by vie1224 on 2017/8/22.
 */
public interface MonitorService {

    //查询终端列表
    PageUtil selectMonitorInfo(Integer pageIndex, Integer pageSize, String uuid);
}
