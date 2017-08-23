package com.hsyd.service.impl;

import com.hsyd.dao.UserMapper;
import com.hsyd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by vie1224 on 2017/8/23.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public String selectUser(String name) {


        String password2 = userMapper.selectUser(name);

        return password2;
    }
}
