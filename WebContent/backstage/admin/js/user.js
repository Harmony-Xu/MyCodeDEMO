$(function (){
	layui.form.render();
});
	//表格
	var realname=$("#realname").val();
	layui.use('table', function(){		  
		  //form表单
	  var form = layui.form;	  		  		  
	  var table = layui.table;
	  //方法级渲染
	  table.render({
	    elem: '#ordergride'
	    ,url: path+'/admin/selectAllUsers'
	    ,totalRow: true
	    ,loading: true
	    ,cols: [[     
	     {checkbox : true,LAY_CHECKED : false,filter : 'test'}
	     ,{field:'realname', title: '用户名称'}
	     ,{field:'sex', title: '性别', templet: function(res){
	    	 if(res.sex=="0"){
	    		 return "男";
	    	 }else{
	    		 return "女";
	    	 }
	       
	      }}
	     ,{field:'age', title: '年龄'}
	     ,{field:'email', title: '邮箱'}
	     ,{field:'cataloguenumbermax', title: '最大目录数量'}
	     ,{field:'capacity', title: '最大容量'}
	     ,{field:'totalnumber', title: '已上传数量'}
	     ,{field:'totalcapacity', title: '已上传容量'}
	     ,{fixed: 'right', title: '操作',width:150, align:'center', toolbar: '#barDemo'}
	    ]]
	    ,id: 'testReload'
	    ,page: true
	    ,height: 500
	    ,where :{'realname': realname}
	  });
	  
	  var $ = layui.$, active = {
	    reload: function(){//对应搜索按钮的 data-type
	      //执行重载
	      var realname=$("#realname").val();
	      table.reload('testReload', {//这里连接的是表格的id属性  ,id: 'testReload'
	        page: {
	          curr: 1 //重新从第 1 页开始
	        }
	        ,where: {//这里不能有key，否则值传不到后台去
	            'realname': realname         
	        }
	      });
	    }
	  };
	  
	  
	  //通过css样式被按钮绑定点击事件
	  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	  	
	  
	 table.on('tool(ordergride)', function(obj){ //table的id  id="ordergride" tool是工具条事件名，
	  //obj是当前行所有的值 获取lay-event属性的值来判断是什么操作
	    var data = obj.data;//也是选中行对象
	    if(obj.event === 'del'){
	      layer.confirm('真的要删除该条数据么？', function(index){//回调函数
	      	del(data.id);   
	        layer.close(index);
	      });
	    }
	    if(obj.event === 'update'){		
		      	updateshow(data);   	
		    }
	  });	    
	  
	  
});
function del(id){
 		  $.ajax({
			url: path+"/admin/delUser",
			dataType: "json",
			type: "post",
			data: {"id":id},
			success: function (req){
				if (req){
					layer.msg('删除成功！',{offset: 320,icon: 1,time:2000});	//刷新页面 
					setTimeout(function() {
					location=location;
					}, 2000);													
				}else{
					layer.msg("失败！",{offset:320,icon: 2});
				}
			},
			error: function(req){
				layer.msg("请联系管理员！",{offset:320,icon: 5});
				}
		});   		 
}	

function updateshow(data){
	
	$("#updateModal #id").val(data.id);
	$("#updateModal #capacity").val(data.capacity);
	$("#updateModal #cataloguenumbermax").val(data.cataloguenumbermax);
	$('#updateModal').modal('show');
	
}

function updateRL(){
	$('#updateModal1').modal('show');
}

function updateRLgo(){
	var totalcapacity=$("#updateModal1 #totalcapacity").val();
	var onemax=$("#updateModal1 #onemax").val();
	  $.ajax({
		url: path+"/admin/updateRL",
		dataType: "json",
		type: "post",
		data: {"totalcapacity":totalcapacity,"onemax":onemax},
		success: function (req){
			if (req){
				layer.msg('修改成功！',{offset: 320,icon: 1,time:2000});	//刷新页面 
				location=location;
			}else{
				layer.msg("失败！",{offset:320,icon: 2});
			}
		},
		error: function(req){
			layer.msg("请联系管理员！",{offset:320,icon: 5});
			}
	});   		 
}	
