package com.wisoft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisoft.mapper.UserMapper;
import com.wisoft.pojo.User;
import com.wisoft.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Override
	public User login(String userid, String password, String type) {
		User user = new User();
		user.setUserid(userid);
		user.setPassword(password);
		user.setIsadmin(Integer.parseInt(type));
		return userMapper.login(user);
	}

	@Override
	public boolean insert(User user) {
		boolean flag = false;
		if(userMapper.insertSelective(user) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertuser(User user) {
		boolean flag = false;
		user.setIsadmin(0);
		if(userMapper.insert(user) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public Map<String, Object> selectAllUser(Map<String, Object> map) {
		Map<String, Object> maps = new HashMap<String, Object>();
		List<User> users = userMapper.selectAllUser(maps);
		List<User> userGetCount = userMapper.selectAllCount();
		int code=0;
		String msg="";
		maps.put("code", code);
		maps.put("count", userGetCount.size());
		maps.put("msg", msg);
		maps.put("data", users);
		return maps;
	}

	@Override
	public boolean delUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User getbyuserid(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
