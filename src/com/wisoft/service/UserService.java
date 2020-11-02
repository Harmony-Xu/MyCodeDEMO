package com.wisoft.service;

import java.util.Map;

import com.wisoft.pojo.User;

public interface UserService {

	//登陆
	User login(String userid,String password,String type);
	//注册
	boolean insert(User user);
	//修改
	boolean update(User user);
	//添加用户
	boolean insertuser(User user);
	//后台
	//会员信息查询
	Map<String, Object> selectAllUser(Map<String, Object> map);
	//查在线
	//Map<String, Object> selectAllUserZX(Map map);
	//删除
	boolean delUser(User user);

	User getbyuserid(Integer id);
	
}
