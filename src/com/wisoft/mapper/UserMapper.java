package com.wisoft.mapper;

import java.util.List;
import java.util.Map;

import com.wisoft.pojo.User;


public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    //通用登录
    User login(User record);
     
    List<User> selectAllUser(Map<String, Object> map);
    //List<User> selectAllUserZX(Map<String, Object> map);
    List<User> selectAllCount();
}