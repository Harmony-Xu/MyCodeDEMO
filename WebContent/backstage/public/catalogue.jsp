<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    <title></title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
			<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index.html" class="active"><i class="lnr lnr-home"></i> <span>菜式管理</span></a></li>
						<li><a href="elements.html" class=""><i class="lnr lnr-code"></i> <span>评论管理</span></a></li>
						<li><a href="charts.html" class=""><i class="lnr lnr-chart-bars"></i> <span>客户建议</span></a></li>
						<li><a href="panels.html" class=""><i class="lnr lnr-cog"></i> <span>友情链接</span></a></li>
						<li><a href="#subPages"  class=""><i class="lnr lnr-file-empty"></i> <span>新闻管理</span></a></li>
						<li><a href="tables.html" class=""><i class="lnr lnr-dice"></i> <span>新闻类别管理</span></a></li>
						<li><a href="typography.html" class=""><i class="lnr lnr-text-format"></i> <span>公告管理</span></a></li>
						<li><a href="panels.html" class=""><i class="lnr lnr-cog"></i> <span>未受理订单管理</span></a></li>
						<li><a href="#subPages"  class=""><i class="lnr lnr-file-empty"></i> <span>已受理订单管理</span></a></li>						
						<li><a href="elements.html" class=""><i class="lnr lnr-code"></i> <span>菜式类别管理</span></a></li>
						<li><a href="charts.html" class=""><i class="lnr lnr-chart-bars"></i> <span>会员信息管理</span></a></li>
						<li><a href="panels.html" class=""><i class="lnr lnr-cog"></i> <span>会员信息管理</span></a></li>
						<li><a href="notifications.html" class=""><i class="lnr lnr-alarm"></i> <span>新闻类别管理</span></a></li>
					</ul>
				</nav>
			</div>
		</div>

  </body>
</html>
