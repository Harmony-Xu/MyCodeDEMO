<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>Home</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/ordering/backstage/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/ordering/backstage/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/ordering/backstage/assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="/ordering/backstage/assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="/ordering/backstage/assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/ordering/backstage/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/ordering/backstage/assets/img/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/js/layer/css/layui.css"  media="all">
    <script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/layer/layui.all.js"></script>  
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/layer/lay/modules/table.js"></script> 
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
				<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<!--箭头  -->
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>

				<div class="navbar-btn navbar-btn-right">
					<a class="btn btn-success update-pro" href="${pageContext.request.contextPath }/admin/logout" title="Upgrade to Pro"><i class="lnr lnr-exit"></i> <span>退出系统</span></a>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a  class="dropdown-toggle" data-toggle="dropdown"> <span>当前时间：<span id="gettime"> </span></span> </a>
						</li>
						<li class="dropdown">
							<a  class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/user.png" class="img-circle" alt="Avatar"> <span>${sessionScope.admin.realname }</span> </a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index.jsp" ><i class="lnr lnr-home"></i> <span>菜式管理</span></a></li>
						<li><a href="Comments-PL.jsp" class=""><i class="lnr lnr-code"></i> <span>评论管理</span></a></li>
						<li><a href="Suggestion-KHJY.jsp" ><i class="lnr lnr-chart-bars"></i> <span>客户建议</span></a></li>
						<li><a href="Link.jsp" class=""><i class="lnr lnr-cog"></i> <span>友情链接</span></a></li>
						<li><a href="News.jsp"  class=""><i class="lnr lnr-file-empty"></i> <span>新闻管理</span></a></li>
						<li><a href="NewsType.jsp" class="active"><i class="lnr lnr-dice"></i> <span>新闻类别管理</span></a></li>
						<li><a href="Public.jsp" class=""><i class="lnr lnr-text-format"></i> <span>公告管理</span></a></li>
						<li><a href="Order-WSL.jsp" class=""><i class="lnr lnr-cog"></i> <span>未受理订单管理</span></a></li>
						<li><a href="Order-YSL.jsp" class=""><i class="lnr lnr-cog"></i> <span>已受理订单管理</span></a></li>
						<li><a href="FoodType.jsp" class=""><i class="lnr lnr-code"></i> <span>菜式类别管理</span></a></li>
						<li><a href="User.jsp" class=""><i class="lnr lnr-chart-bars"></i> <span>会员信息管理</span></a></li>
						<li><a href="Admin.jsp"  ><i class="lnr lnr-chart-bars"></i> <span>个人信息管理</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						
						<div class="panel-body">
						
								<div class="demoTable">
									  下单时间：
									  <div class="layui-inline">
									    <input type="hidden"  name="userid" id="userid" value="${sessionScope.user.id}">
									    <input class="layui-input" name="orderdata" id="orderdata" autocomplete="off">
									  </div>
									  <button class="layui-btn" data-type="reload">搜索</button>
								</div>							 
								<table class="layui-hide" id="ordergride" lay-filter="ordergride"></table> 
		                        
						
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>

	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="/ordering/backstage/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/ordering/backstage/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/ordering/backstage/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/ordering/backstage/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/ordering/backstage/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/ordering/backstage/assets/scripts/klorofil-common.js"></script>
	<script src="/ordering/backstage/js/common.js"></script>
	<script src="/ordering/backstage/js/index.js"></script>

</body>

</html>
