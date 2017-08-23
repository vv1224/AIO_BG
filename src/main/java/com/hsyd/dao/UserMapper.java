package com.hsyd.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by vie1224 on 2017/8/23.
 */
@Repository
public interface UserMapper {
    String selectUser(@Param("name") String name);
}
