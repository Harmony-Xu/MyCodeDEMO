<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
	<title>Login</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/js/layer/css/layui.css"  media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage/assets/css/demo.css">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/backstage/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath }/backstage/assets/img/favicon.png">
    <script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath }/backstage/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/layer/layui.all.js"></script> 
    <script>
		  var path="${pageContext.request.contextPath}";
	</script>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left" >
						<div class="content" style="border: 1px;margin-top: -500px;">
							<div class="header">
								<div class="logo text-center"><img src="${pageContext.request.contextPath }/backstage/assets/img/logo-dark.png" alt="Klorofil Logo"></div>
			
							</div>
						<form class="form-auth-small" id="loginForm" action="${pageContext.request.contextPath }/user/login">
								<div class="form-group">
									<label for="signin-email" class="control-label sr-only">用户名</label>
									<input type="text" class="form-control" id="userid"  name="userid" required="required" placeholder="请输入用户名">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">密码</label>
									<input type="password" class="form-control" id="password"  name="password" required="required" placeholder="请输入密码">
								</div>
								<div class="form-group">
									
									<select   id="type" name="type" style="width: 390px;height: 40px;font-size: 13px;">
										<option value="0">普通用户</option>
										<option value="1">管理员</option>
									</select>
									<!-- <input name="loginType" type="radio" value="1" id="loginType1" style="margin-left:10px;"/><label style="color:black" for="loginType1">管理员 </label>
                            		<input name="loginType" type="radio" value="0" id="loginType2" style="margin-left:10px;"/><label style="color:bl" for="loginType2">用户 </label> -->
								</div>
								<div class="form-group clearfix">
									<label class="fancy-checkbox element-left">
										<input type="checkbox">
										<a onclick="modelshow();">注册</a>
									</label>
								</div>
								<button type="submit" id="sysSubmit" class="btn btn-primary btn-lg btn-block">登录</button>
								<!-- <a href="javascript:;" type="button" class="btn btn-danger btn-block btn-login" onclick="submitForm()">
	                            <i class="fa fa-sign-in"></i>
	                            系统登录
	                            </a> -->
								<span style="color: red">${requestScope.error}</span>
							</form>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">网盘管理系统</h1>
							<p>Safety and shortcut</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">添加</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<form class="layui-form" action="${pageContext.request.contextPath }/user/insertuser" id="insertForm" method="post">
						  <div style="margin-top: 50px;"  class="layui-form-item">
						    <label class="layui-form-label">账号</label>
						    <div class="layui-input-block">
						    <input type="hidden" id="id" name="id">
						      <input type="text" id="userid" name="userid" required   placeholder="请输入账号" autocomplete="off" class="layui-input">
						    </div>
						  </div>
		
						  <div style="margin-top: 20px;"  class="layui-form-item">
						    <label class="layui-form-label">密码</label>
						    <div class="layui-input-block">
						      <input type="text" id="password" name="password" required   placeholder="请输入密码" autocomplete="off" class="layui-input">
						    </div>
						  </div>
						  <div style="margin-top: 20px;"  class="layui-form-item">
						    <label class="layui-form-label">姓名</label>
						    <div class="layui-input-block">
						      <input type="text" id="username" name="username" required   placeholder="请输入姓名" autocomplete="off" class="layui-input">
						    </div>
						  </div>
						  <!-- <div style="margin-top: 20px;"  class="layui-form-item">
						    <label class="layui-form-label">输入框</label>
						    <div class="layui-input-block">
						      <input type="text" id="age" name="age" required    placeholder="请输入年龄" autocomplete="off" class="layui-input">
						    </div>
						  </div> -->
						  <!-- <div style="margin-top: 20px;"  class="layui-form-item">
						    <label class="layui-form-label">输入框</label>
						    <div class="layui-input-block">
						      <input type="text" id="email" name="email" required    placeholder="请输入邮箱" autocomplete="off" class="layui-input">
						    </div>
						  </div> -->						
						 <!-- <div class="layui-form-item">
						    <label class="layui-form-label">选择框</label>
						    <div class="layui-input-block">
						      <select name="sex" id="sex" lay-filter="aihao">
								 <option value="0" >男</option>
								 <option value="1" >女</option>
						      </select>
						    </div>
						  </div> -->													  						  							
						  <div class="layui-form-item" style="margin-left: 100px;margin-top: 80px;">
						    <div class="layui-input-block" >
						      <button class="layui-btn" type="button" onclick="add_submit();">立即提交</button>
						      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
						    </div>
						  </div>
				</form>
			</div>
		</div>
</div>
<script type="text/javascript">
		function modelshow(){
	   $('#insertModal').modal('show');
	}
	
		/* $("#sysSubmit").click(function(){
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/user/login",
				data: $("#loginForm").serialize(),
				dataType: "JSON",
				success:function(data){
					// if(result.code==1){
                        var lt = getCheckBoxVal('loginType');
                        if(lt=='1'){
                            window.location.href="${pageContext.request.contextPath}/admin/User.jsp";
                            }
                            if(lt=='0'){
                                window.location.href="${pageContext.request.contextPath}/User.jsp";
                                }
                                }else{
                                	${requestScope.error};
                                    //$.messager.alert("消息提醒",result.msg,"warning");
                                } 
                     
                  }
				}
				
			});
		}); */
		
		
	function add_submit(){
		var flag=true;//判断表单是否提交
		var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
	
		var userid=$("#insertForm #userid").val();
		if(userid==null || userid=="" || userid==undefined){
			layer.msg("请输入账号！",{offset:320,icon: 5});
			return;
		}else{
		        if(pattern.test(userid)){
		            layer.msg("账号只能由字母与数字组成", {icon: 5});
		            return;
		        }
		}	
		var password=$("#insertForm #password").val();
		if(password==null || password==""|| password==undefined){
		layer.msg("请输入密码！",{offset:320,icon: 5});
			return;
		}else{
			
		    if(pattern.test(password)){
		       layer.msg("请输入数字0-9", {icon: 5});
		       return;
		       }else{
		       		if(isNaN(password)){
		       layer.msg("请输入数字0-9", {icon: 5});
		       return;		       		
		       		}
		       }
		}
	
		var username=$("#insertForm #username").val();			
		if(username==null || username==""|| username==undefined){
		layer.msg("请输入姓名！",{offset:320,icon: 5});
			return;
		}else{
			var aaa = new RegExp("[qazwsxedcrfvtgbyhnujmiklopQAZWSXEDCRFVTGBYHNUJMIKLOP`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
		    if(pattern.test(username)){
		       layer.msg("请输入中文或者数字", {icon: 5});
		       return;
		       }else if(aaa.test(username)){
			       	layer.msg("请输入中文或者数字", {icon: 5});
			       return;
		       }
		   /*   else{		     	
		     	var re=new RegExp("/[^/u4e00-/u9fa5]/");
		     	if (re.test(realname)){
		     		
		     	}else{
		     		layer.msg("请输入中文或者数字", {icon: 5});
		      	    return;
		     	}
		     } */
		}			
		/* var age=$("#insertForm #age").val();
		if(age==null || age==""|| age==undefined){
		   layer.msg("请输入年龄！",{offset:320,icon: 5});
			return;
		}else{
		    if(pattern.test(age)){
		       layer.msg("请输入中文或者数字", {icon: 5});
		       return;
		     }else{
		       		if(isNaN(age)){
				       layer.msg("请输入数字0-9", {icon: 5});
				       return;		       		
		       		}
		       }
		} */
	 
		if(flag){
			$("#insertForm").submit();
		}else{
			 layer.msg("注册失败！",{offset:320,icon: 5});
		} 
		
	}
	$(function (){
		layui.form.render();
	});
	
</script>
</body>

</html>
