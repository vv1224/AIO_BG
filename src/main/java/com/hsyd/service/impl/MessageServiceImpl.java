package com.hsyd.service.impl;

import com.hsyd.dao.MessageMapper;
import com.hsyd.model.Message;
import com.hsyd.model.MessagePojo;
import com.hsyd.service.MessageService;
import com.hsyd.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vie1224 on 2017/8/24.
 */
@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Override
    public PageUtil selectMessageList(Integer pageIndex, Integer pageSize) {

        List<Message> messageList = new ArrayList<>();
        PageUtil pageUtil = new PageUtil();
        try {
            pageUtil.setPageSize(pageSize);
            int rows = messageMapper.selectTotal();
            pageUtil.setRows(rows);
            pageUtil.setPageIndex(pageIndex);
            messageList = messageMapper.selectMonitorInfo(pageUtil);
            pageUtil.setResultList(messageList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return pageUtil;
    }

    @Override
    public MessagePojo selectMessageInfo(String uuid) {
        MessagePojo messagePojo = new MessagePojo();
        messagePojo = messageMapper.selectMessageInfo(uuid);
        return messagePojo;
    }

    @Override
    public void deleteMessageByUuid(String uuid) {
        messageMapper.deleteMessageByUuid(uuid);
    }
}
