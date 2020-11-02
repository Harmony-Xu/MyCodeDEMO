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
<style>
.laytable-cell-10001-0-0 {
	width: 48px;
}
.laytable-cell-10001-0-1 {
	
}
.laytable-cell-10001-0-2 {
	
}
.laytable-cell-10001-0-3 {
	
}
.laytable-cell-10001-0-4 {
	
}
.laytable-cell-10001-0-5 {
	
}
.laytable-cell-10001-0-6 {
	
}
.laytable-cell-10001-0-7 {
	
}
.laytable-cell-10001-0-8 {
	
}
.laytable-cell-10001-0-9 {
	width: 150px;
}
</style>

</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href=""><img src="${pageContext.request.contextPath }/backstage/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
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
							<a  class="dropdown-toggle" data-toggle="dropdown" onclick="updateRL()"> 修改</a>
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
						<li><a href="${pageContext.request.contextPath }/backstage/admin/User.jsp" class="active"><i class="lnr lnr-home"></i> <span>用户管理</span></a></li>
						<li><a href="${pageContext.request.contextPath }/backstage/admin/mulu.jsp" class=""><i class="lnr lnr-chart-bars"></i> <span>目录管理</span></a></li>
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
									  用户名称：
									  <div class="layui-inline">
									    <input class="layui-input" name="username" id="username" autocomplete="off">
									  </div>
									  <button class="layui-btn" data-type="reload">搜索</button> 
								</div>											 			 
								<table class="layui-hide" id="ordergride" lay-filter="ordergride"></table>

							<div class="layui-form layui-border-box layui-table-view"
								lay-filter="LAY-table-10001" lay-id="testReload"
								style="height: 500px;">
								<div class="layui-table-box">
									<div class="layui-table-header">
										<table cellspacing="0" cellpadding="0" border="0"
											class="layui-table">
											<thead>
												<tr>
													<th data-field="0" data-key="10001-0-0"
														data-unresize="true" class=" layui-table-col-special"><div
															class="layui-table-cell laytable-cell-10001-0-0 laytable-cell-checkbox">
															<input type="checkbox" name="layTableCheckbox"
																lay-skin="primary" lay-filter="layTableAllChoose">
															<div class="layui-unselect layui-form-checkbox"
																lay-skin="primary">
																<i class="layui-icon layui-icon-ok"></i>
															</div>
														</div></th>
													<th data-field="userid" data-key="10001-0-1" class=""><div
															class="layui-table-cell laytable-cell-10001-0-1">
															<span>账号名称</span>
														</div></th>
													<th data-field="username" data-key="10001-0-2" class=""><div
															class="layui-table-cell laytable-cell-10001-0-2">
															<span>用户名</span>
														</div></th>
													<!-- <th data-field="age" data-key="10001-0-3" class=""><div
															class="layui-table-cell laytable-cell-10001-0-3">
															<span>年龄</span>
														</div></th>
													<th data-field="email" data-key="10001-0-4" class=""><div
															class="layui-table-cell laytable-cell-10001-0-4">
															<span>邮箱</span>
														</div></th>
													<th data-field="cataloguenumbermax" data-key="10001-0-5"
														class=""><div
															class="layui-table-cell laytable-cell-10001-0-5">
															<span>最大目录数量</span>
														</div></th>
													<th data-field="capacity" data-key="10001-0-6" class=""><div
															class="layui-table-cell laytable-cell-10001-0-6">
															<span>最大容量</span>
														</div></th> -->
													<th data-field="totalnumber" data-key="10001-0-7" class=""><div
															class="layui-table-cell laytable-cell-10001-0-7">
															<span>已上传数量</span>
														</div></th>
													<!-- <th data-field="totalcapacity" data-key="10001-0-8"
														class=""><div
															class="layui-table-cell laytable-cell-10001-0-8">
															<span>已上传容量</span>
														</div></th> -->
													<th data-field="9" data-key="10001-0-9"
														class=" layui-table-col-special"><div
															class="layui-table-cell laytable-cell-10001-0-9"
															align="center">
															<span>操作</span>
														</div></th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="layui-table-body layui-table-main"
										style="height: 378px;">
										<div class="layui-none">数据接口请求异常：error</div>
									</div>
									<div class="layui-table-fixed layui-table-fixed-r layui-hide"
										style="right: -1px;">
										<div class="layui-table-header">
											<table cellspacing="0" cellpadding="0" border="0"
												class="layui-table">
												<thead>
													<tr>
														<th data-field="9" data-key="10001-0-9"
															class=" layui-table-col-special"><div
																class="layui-table-cell laytable-cell-10001-0-9"
																align="center">
																<span>操作</span>
															</div></th>
													</tr>
												</thead>
											</table>
											<div class="layui-table-mend"></div>
										</div>
										<div class="layui-table-body" style="height: auto;">
											<table cellspacing="0" cellpadding="0" border="0"
												class="layui-table">
												<tbody></tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="layui-table-total">
									<table cellspacing="0" cellpadding="0" border="0"
										class="layui-table">
										<tbody>
											<tr>
												<td><div class="layui-table-cell"
														style="visibility: hidden;">Total</div></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="layui-table-page">
									<div id="layui-table-page10001"></div>
								</div>
								
							</div>




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
    <button class="layui-btn layui-btn-sm" lay-event="del">删除</button>
    <button class="layui-btn layui-btn-sm" lay-event="update">修改</button>
  </div>
</script>

	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/assets/scripts/klorofil-common.js"></script>
	<script>
		  var path="${pageContext.request.contextPath}";	
	</script>
	<script src="${pageContext.request.contextPath }/backstage/js/common.js"></script>
	<script src="${pageContext.request.contextPath }/backstage/admin/js/user.js"></script>
 
</body>

<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">修改</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<form class="layui-form" action="${pageContext.request.contextPath }/user/updateuseradmin" method="post">

						 <input type="hidden" id="id" name="id">
						  <div style="margin-top: 20px;"  class="layui-form-item">
						    <label class="layui-form-label">输入框</label>
						    <div class="layui-input-block">
						      <input type="text" id="cataloguenumbermax" name="cataloguenumbermax" required   placeholder="请输入允许用户创建的最大目录数量" autocomplete="off" class="layui-input">
						    </div>
						  </div>
						  <div style="margin-top: 20px;"  class="layui-form-item">
						    <label class="layui-form-label">输入框</label>
						    <div class="layui-input-block">
						      <input type="text" id="capacity" name="capacity" required   placeholder="请输入允许用户上传文件最大容量" autocomplete="off" class="layui-input">
						    </div>
						  </div>
															  						  							
						  <div class="layui-form-item" style="margin-left: 100px;margin-top: 80px;">
						    <div class="layui-input-block" >
						      <button class="layui-btn" type="submit">立即提交</button>
						      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
						    </div>
						  </div>
				</form>
			</div>
		</div>
</div>

<div class="modal fade" id="updateModal1" tabindex="-1" role="dialog"
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

</html>
