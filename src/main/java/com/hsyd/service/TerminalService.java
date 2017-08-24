package com.hsyd.service;

import com.hsyd.model.Terminal;

/**
 * Created by vie1224 on 2017/8/24.
 */
public interface TerminalService {
    void updateTerminal(Terminal terminal);

    //新增终端
    void insertTerminal(Terminal terminal);

    //删除终端
    void deleteTerminal(String uuid);
}
