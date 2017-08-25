package com.hsyd.service;

import com.hsyd.utils.PageUtil;

/**
 * Created by vie1224 on 2017/8/25.
 */
public interface StatisticalManagementService {
    PageUtil select(Integer pageIndex, Integer pageSize, String startTime);
}
