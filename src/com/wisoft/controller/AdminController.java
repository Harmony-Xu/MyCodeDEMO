package com.wisoft.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisoft.service.UserService;
import com.wisoft.utils.PageBean;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	UserService userService;
	
	/*
	 * 管理员退出
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("admin");
		return "backstage/login";
	}
	
	/*
	 * 查询所有用户
	 */
	@RequestMapping("selectAllUsers")
	@ResponseBody
	public Map<String, Object> selectAllUsers(@RequestParam("page") String page
			,@RequestParam("limit") String limit,@RequestParam("username") String username,HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();	
		
		PageBean bean=new PageBean();
		bean.setPageNo(Integer.parseInt(page));
		bean.setPageSize(Integer.parseInt(limit));
		map.put("username", username);
		map.put("pageBean", bean);		
		return userService.selectAllUser(map);
	}
}
