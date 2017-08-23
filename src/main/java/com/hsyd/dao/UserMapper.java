package com.hsyd.dao;

import com.hsyd.model.User;
import com.hsyd.utils.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by vie1224 on 2017/8/23.
 */
@Repository
public interface UserMapper {
    String selectUser(@Param("name") String name);

    void insertUser(@Param("name") String name,@Param("password") String password,@Param("roleId") Integer roleId);

    int selectTotal();

    List<User> selectUserList(PageUtil pageUtil);
}
