package com.zhou.service.impl;

import com.zhou.dao.JoinmeMapper;
import com.zhou.dao.UserMapper;
import com.zhou.model.Joinme;
import com.zhou.service.JoinmeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by icepoint1999 on 3/21/16.
 */
@Service
public class JoinServiceImpl implements JoinmeService{

    @Autowired

    @Qualifier("joinmeMapper")

    private JoinmeMapper joinmeMapper;
    @Override
    public void insert(Joinme joinme) {
       joinmeMapper.insert(joinme);
    }

    @Override
    public List<Joinme> getbyUserid(int id) {
        return joinmeMapper.selectAllbyUserid(id);
    }

    @Override
    public List<Joinme> getByAid(int id) {
        return joinmeMapper.selectAllbyactivityid(id);
    }

    @Override
    public List<Joinme> getByAll(int ac, int uid) {
        return joinmeMapper.selectByAllid(ac,uid);
    }
}
