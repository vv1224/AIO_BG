package com.hsyd.service.impl;

import com.hsyd.dao.TerminalMapper;
import com.hsyd.model.Terminal;
import com.hsyd.service.TerminalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by vie1224 on 2017/8/24.
 */
@Service
public class TerminalServiceImpl implements TerminalService {

    @Autowired
    private TerminalMapper terminalMapper;

    @Override
    public void updateTerminal(Terminal terminal) {
        terminalMapper.updateTerminal(terminal);
    }

    @Override
    public void insertTerminal(Terminal terminal) {
        terminalMapper.insertTerminal(terminal);
    }

    @Override
    public void deleteTerminal(String uuid) {
        terminalMapper.deleteTerminal(uuid);
    }
}
