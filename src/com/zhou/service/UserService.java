package com.zhou.service;

import com.zhou.model.User;

public interface UserService {

	int insertUser(User users);
	int updateUser();
	int deleteUser(User user);
	User findUserByid(int id);
	User findUserByemail(String email);

}
