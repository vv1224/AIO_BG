package com.hsyd.dao;

import com.hsyd.model.Message;
import com.hsyd.model.MessagePojo;
import com.hsyd.utils.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by vie1224 on 2017/8/24.
 */
@Repository
public interface MessageMapper {
    int selectTotal();

    List<Message> selectMonitorInfo(PageUtil pageUtil);

    //查询详情
    MessagePojo selectMessageInfo(@Param("uuid") String uuid);

    //删除message
    void deleteMessageByUuid(String uuid);
}
