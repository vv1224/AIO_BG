package com.hsyd.utils;

import java.util.UUID;

/**
 * Created by vie1224 on 2017/8/24.
 */
public class CommonUtils {

    /**
     * 获取uuid
     * @return
     */
    public static UUID getUUID(){
        UUID uuid = UUID.randomUUID();
        return uuid;
    }

}
