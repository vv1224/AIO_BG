package com.hsyd.service;

import com.hsyd.utils.PageUtil;

/**
 * Created by vie1224 on 2017/8/24.
 */
public interface MessageService {
    PageUtil selectMessageList(Integer pageIndex, Integer pageSize);
}
