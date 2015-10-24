package com.zhou.service.impl;

import com.zhou.dao.UserMapper;
import com.zhou.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zhou.service.UserService;
 
 
 
@Service
public class UserServiceImpl implements UserService{
 
    @Autowired

    @Qualifier("userMapper")

    private UserMapper userMapper;


    @Override
    public int insertUser(User users) {
        return userMapper.insert(users);
    }

    @Override
    public int updateUser() {
        return 0;
    }

    @Override
    public int deleteUser(User user) {
        return 0;
    }

    @Override
    public User findUserByid(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public User findUserByemail(String email) {

        return userMapper.selectByEmail(email);
    }
}