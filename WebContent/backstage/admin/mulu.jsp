<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>Home</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/backstage/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath }/backstage/assets/img/favicon.png">
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
				<a href="index.html"><img src="${pageContext.request.contextPath }/backstage/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
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
							<a  class="dropdown-toggle" data-toggle="dropdown"> <span><span id="">总容量${sessionScope.jurisdiction.totalcapacity }KB/已使用${sessionScope.jurisdiction.nowcapacity }KB </span></span> </a>
						</li>
						<li class="dropdown">
							<a  class="dropdown-toggle" data-toggle="dropdown"> <span><span id="">单次文件最大上传${sessionScope.jurisdiction.onemax }KB </span></span> </a>
						</li>
						<li class="dropdown">
							<a  class="dropdown-toggle" data-toggle="dropdown" onclick="updateRL()"> <span><span id="">修改</span></span> </a>
						</li>
						<li class="dropdown">
							<a  class="dropdown-toggle" data-toggle="dropdown"><img src="${pageContext.request.contextPath }/backstage/assets/img/user.png" class="img-circle" alt="Avatar"> <span>${sessionScope.admin.username}</span> </a>
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
						<li><a href="${pageContext.request.contextPath }/backstage/admin/User.jsp" class=""><i class="lnr lnr-home"></i> <span>用户管理</span></a></li>
						<li><a href="${pageContext.request.contextPath }/backstage/admin/mulu.jsp" class="active"><i class="lnr lnr-chart-bars"></i> <span>目录管理</span></a></li>
						<li><a href="${pageContext.request.contextPath }/backstage/admin/wenjian.jsp" class=""><i class="lnr lnr-cog"></i> <span>文件管理</span></a></li>
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
									  目录名称：
									  <div class="layui-inline">
									    <input class="layui-input" name="cataloguename" id="cataloguename" autocomplete="off">
									  </div>
									  <button class="layui-btn" data-type="reload">搜索</bu
									  tton>
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
<script type="text/html" id="barDemo">
  <div class="layui-btn-container" >
    <button class="layui-btn layui-btn-sm" lay-event="delete">删除</button>
  </div>
</script>
		
	<!-- Javascript -->
	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/scripts/klorofil-common.js"></script>
	<script>
		  var path="${pageContext.request.contextPath}";	
	</script>
	<script src="${pageContext.request.contextPath }/backstage/js/common.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/admin/js/mulu.js"></script>	
	
	
	<!--修改拟态框  -->
	<!--修改拟态框  -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">修改</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<form class="layui-form"  id="updateForm">
						  <div style="margin-top: 50px;"  class="layui-form-item">
						    <label class="layui-form-label">总容量</label>
						    <div class="layui-input-block">
						      <input type="text" id="totalcapacity" name="totalcapacity" required   lay-verify="required" placeholder="请输入总容量" value="${sessionScope.jurisdiction.totalcapacity }" autocomplete="off" class="layui-input">
						    </div>
						  </div>
						  <div style="margin-top: 30px;"  class="layui-form-item">
						    <label class="layui-form-label">单次</label>
						    <div class="layui-input-block">
						      <input type="text" id="onemax" name="onemax" required   lay-verify="required" placeholder="请输入允许单次最大文件上传大小"  value="${sessionScope.jurisdiction.onemax }" autocomplete="off" class="layui-input">
						    </div>
						  </div>	  						  							
						  <div class="layui-form-item" style="margin-left: 100px;margin-top: 80px;">
						    <div class="layui-input-block" >
						      <button class="layui-btn" onclick="updateRLgo()">立即提交</button>
						      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
						    </div>
						  </div>
				</form>
			</div>
		</div>
</div>
	
</body>

</html>
