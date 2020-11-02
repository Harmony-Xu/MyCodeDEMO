$(function (){
	layui.form.render();
});
	//表格
	var filename=$("#filename").val();
	layui.use('table', function(){
		  //form表单
	  var form = layui.form;	  		  		  
	  var table = layui.table;
	  //方法级渲染
	  table.render({
	    elem: '#ordergride'
	    ,url: path+'/admin/selectAllFile'
	    ,totalRow: true
	    ,loading: true
	    ,toolbar: '#toolbarDemo'
	    ,cols: [[     
	     {checkbox : true,LAY_CHECKED : false,filter : 'test'}
	     ,{field:'', title: '目录名称', templet: function(res){   
	    		  return  res.catalogue.cataloguename ;	   
	      }}
	     ,{field:'filename', title: '文件名称'}
	     ,{field:'', title: '用户名', templet: function(res){   
   		  	return  res.user.realname;
	     }}
	     ,{field:'filesize', title: '文件大小'}
	     ,{field:'fileformat', title: '文件格式'}
	     ,{field:'', title: '文件下载', templet: function(res){   
	   		  	return  "<span><a href='"+path+"/user/download?filename="+res.filename+"'>下载</></span>";
		     }}
	     ,{fixed: 'right', title: '操作',width:150, align:'center', toolbar: '#barDemo'}
	    ]]
	    ,id: 'testReload'
	    ,page: true
	    ,height: 500
	    ,where :{'filename': filename}
	  });
	  
	  var $ = layui.$, active = {
	    reload: function(){//对应搜索按钮的 data-type
	      //执行重载
	    	var filename=$("#filename").val();
	    	var userid=$("#userid").val();
	      table.reload('testReload', {//这里连接的是表格的id属性  ,id: 'testReload'
	        page: {
	          curr: 1 //重新从第 1 页开始
	        }
	        ,where: {//这里不能有key，否则值传不到后台去
	            'filename': filename
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
	    if(obj.event === 'delete'){
	      layer.confirm('真的要删除该条数据么？', function(index){//回调函数
	      	del(data.id);   
	        layer.close(index);
	      });
	    }
	  });	    
	  
	  
	  table.on('toolbar(ordergride)', function(obj){
		  console.log(obj);
		  var checkStatus = table.checkStatus(obj.config.id);	
		  switch(obj.event){
		    case 'add':
		    	insertshow();
		    break;
		    case 'addphont':	
		    	//insertfoodphotos();
		    break;
		  };
		});
	  
});
	
function del(id){
 		  $.ajax({
			url: path+"/user/delfile",
			dataType: "json",
			type: "post",
			data: {"id":id},
			success: function (req){
				if (req){
					layer.msg('删除成功！',{offset: 320,icon: 1,time:2000});	//刷新页面 
					setTimeout(function() {
					location=location;
					}, 2000)													
				}else{
					layer.msg("失败！",{offset:320,icon: 2});
				}
			},
			error: function(req){
				layer.msg("请联系管理员！",{offset:320,icon: 5});
				}
		});   		 
}	

function updateRL(){
	$('#updateModal').modal('show');
}

function updateRLgo(){
	var totalcapacity=$("#totalcapacity").val();
	var onemax=$("#onemax").val();
	  $.ajax({
		url: path+"/admin/updateRL",
		dataType: "json",
		type: "post",
		data: {"totalcapacity":totalcapacity,"onemax":onemax},
		success: function (req){
			if (req){
				layer.msg('修改成功！',{offset: 320,icon: 1,time:2000});	//刷新页面 
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