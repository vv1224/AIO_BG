package com.hsyd.service;

import com.hsyd.model.User;
import com.hsyd.utils.PageUtil;

/**
 * Created by vie1224 on 2017/8/23.
 */
public interface UserService {
    String selectUser(String name);

    void insertUser(String name, String password, Integer roleId);

    PageUtil selectUserList(Integer pageIndex, Integer pageSize);

    void deleteUserByOne(Integer id);

    //修改用户
    void updateUser(User user);

    //查询单个用户
    User selectUserByOne(Integer id);
}
