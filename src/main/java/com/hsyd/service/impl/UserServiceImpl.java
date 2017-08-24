package com.hsyd.service.impl;

import com.hsyd.dao.UserMapper;
import com.hsyd.model.Terminal;
import com.hsyd.model.User;
import com.hsyd.service.UserService;
import com.hsyd.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public void insertUser(String name, String password, Integer roleId) {

        userMapper.insertUser(name,password,roleId);

    }

    @Override
    public PageUtil selectUserList(Integer pageIndex, Integer pageSize) {
        List<User> userList = new ArrayList<>();
        PageUtil pageUtil = new PageUtil();
        try {
            pageUtil.setPageSize(pageSize);
            int rows = userMapper.selectTotal();
            pageUtil.setRows(rows);
            pageUtil.setPageIndex(pageIndex);
            userList = userMapper.selectUserList(pageUtil);
            pageUtil.setResultList(userList);
        }catch (Exception e){
            e.printStackTrace();
        }

        return pageUtil;
    }

    @Override
    public void deleteUserByOne(Integer id) {

        userMapper.deleteUserByOne(id);

    }

    /**
     * 修改用户
     */
    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public User selectUserByOne(Integer id) {
        User user = userMapper.selectUserByOne(id);
        return user;
    }
}
