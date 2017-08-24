package com.hsyd.dao;

import com.hsyd.model.Message;
import com.hsyd.utils.PageUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by vie1224 on 2017/8/24.
 */
@Repository
public interface MessageMapper {
    int selectTotal();

    List<Message> selectMonitorInfo(PageUtil pageUtil);
}
