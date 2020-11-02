package com.wisoft.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wisoft.pojo.User;
import com.wisoft.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	/*
	 * 用户注册
	 */
	@RequestMapping("insertuser")
	public String insertuser(HttpSession session,HttpServletRequest request,User user) {
		if(userService.insertuser(user)) {
			request.setAttribute("error", "注册成功！");
			return "backstage/login";
		}else {
			request.setAttribute("error", "注册失败");
			return "backstage/login";
		}
	}
	
	/*
	 * 用户登录
	 */
	@RequestMapping(value = "login")
	public String login(@RequestParam("userid") String userid,@RequestParam("password") String password,
			@RequestParam("type") String type,HttpServletRequest request,HttpSession session) {
		User user = userService.login(userid, password, type);
		if(user != null) {
			if(type.equals("1")) {
				session.setAttribute("admin", user);
				return "backstage/admin/User";
			}else {
				session.setAttribute("user", user);
				//user.setStatus(1);
				//userService.update(user);
				return "backstage/User";
			}
		}else {
			request.setAttribute("error","用户名密码错误");			
			return "backstage/login";
		}
	}
	
	/*
	 * 用户退出
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session,Integer id) {
		//User user = userService.getbyuserid(id);
		session.removeAttribute("user");
		return "backstage/login";
	}
}
