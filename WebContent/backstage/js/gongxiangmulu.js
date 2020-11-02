$(function (){
	layui.form.render();
});
	//表格
	var cataloguename=$("#cataloguename").val();
	var userid=$("#userid").val();
	layui.use('table', function(){
		  //form表单
	  var form = layui.form;	  		  		  
	  var table = layui.table;
	  //方法级渲染
	  table.render({
	    elem: '#ordergride'
	    ,url: path+'/user/selectAllcatalogueGX'
	    ,totalRow: true
	    ,loading: true
	   // ,toolbar: '#toolbarDemo'
	    	  ,cols: [[     
	    	      {checkbox : true,field:'id', title:'ID',  fixed: 'left',LAY_CHECKED : false, unresize: true, sort: true, totalRowText: '合计'}
	    	      ,{field:'cataloguename', title: '目录名称'}
	    	      ,{field:'', title: '用户名称', templet: function(res){
	    		    		  return  res.user.realname ;
	    		      }}
	    	      ,{field:'updaloadfilenumbermax', title: '目录容量'}
	    	     ,{field:'jurisdiction', title: '目录类型', templet: function(res){
	    		    	 if(res.jurisdiction==0){
	    		    		  return  "私有" ;
	    		    	 }else{
	    		    		  return  "公有" ;
	    		    	 }
	    		      }}
	    	     ,{field:'filenumber', title: '现有文件数量'}
	    	     ,{field:'filenumbermax', title: '最大文件数量'}	    	     
	    	     ,{fixed: 'right', title: '操作',width:150, align:'center', toolbar: '#barDemo'}
	    	    ]]
	    ,id: 'testReload'
	    ,page: true
	    ,height: 570
	    ,where :{'cataloguename': cataloguename,'userid': userid}
	  });
	  
	  var $ = layui.$, active = {
	    reload: function(){//对应搜索按钮的 data-type
	      //执行重载
	      var cataloguename=$("#cataloguename").val();
	      var userid=$("#userid").val();
	      table.reload('testReload', {//这里连接的是表格的id属性  ,id: 'testReload'
	        page: {
	          curr: 1 //重新从第 1 页开始
	        }
	        ,where: {//这里不能有key，否则值传不到后台去
	            'cataloguename': cataloguename,'userid': userid           
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
	    } else if(obj.event === 'update'){//修改
	        updateshow();
	    } else if(obj.event === 'uploadfile'){//修改
	    	addfileshow(data);
	    }
	  });	    
	  
	 
	  
	  table.on('toolbar(ordergride)', function(obj){
		  console.log(obj);
		  var checkStatus = table.checkStatus(obj.config.id);	
		  switch(obj.event){
		    case 'add':
		    	insertshow();
		    break;
		  };
		});
	  
});

	
function insertshow(){
	 
	 $('#insertModal').modal('show');
}

function addfileshow(data){
	$("#addfile #catalogueid").val(data.id);//目录id
	$("#addfile #yzuserid").val(data.userid);//目录id
	$('#addfile').modal('show');
}
function updateshow(data){
	$("#updateModal #id").val(data.id);
	$("#updateModal #cataloguenamecataloguename").val(data.cataloguename);
	$("#updateModal #updaloadFilenumbermax").val(data.updaloadFilenumbermax);
	$("#updateModal #catalogue").val(data.catalogue);
	$("#updateModal #jurisdiction").val(data.jurisdiction);
	$("#updateModal #filenumbermax").val(data.filenumbermax);
	$('#updateModal').modal('show');
}

function del(id){
	  $.ajax({
		url: path+"/user/delcatalogue",
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


function insert(){
	var data= $("#insertForm").serialize();
	 $.ajax({
			url: path+"/user/insertcatalogue",
			dataType: "json",
			type: "post",
			data: data,
			success: function (req){
				if (req){
					layer.msg('添加成功！',{offset: 320,icon: 1,time:2000});	//刷新页面 
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

function update(){
	var data= $("#updateForm").serialize();
	 $.ajax({
			url: path+"/user/updatecatalogue",
			dataType: "json",
			type: "post", 
			data: data,
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
				layer.msg("请联系管理员1！",{offset:320,icon: 5});
				}
		});   		
}

function check(userid) { 
	var sizeflag=true;
    // 获取文件
	var flag=false;
	var flag1=false;
    var f = document.getElementById("file").files;  
	//先判断本次上传文件大小是否满足系统限定的大小
	var fsize=f[0].size/1024;
	var totalcapacity=$("#totalcapacity").val();//总容量
	var nowcapacity=$("#nowcapacity").val();//已使用
	var onemax=$("#onemax").val();//单次

	if(fsize>onemax){
		sizeflag=false;
		layer.msg('本次上传超过单次上传限制大小！',{offset: 320,icon: 1,time:2000});
		return;
	}
	

	var totlesize=(fsize+nowcapacity)

	if(totlesize>totalcapacity){
		sizeflag=false;
		layer.msg('本次上传超过本系统总容量限制大小！',{offset: 320,icon: 1,time:2000});
		return;
	}
	//再判断上传本次文件之后是否超出总容量
	if(sizeflag){
	    //先验证文件名是否重复
	    var filename = f[0].name.toLowerCase();
	        $.ajax({
	    		url: path+"/user/panduan",
	    		dataType: "json",
	    		type: "post", 
	    		data: {"userid":userid,"filename":filename},
	    		success: function (req){
	    			if (req.length==0){//表示没有这个文件直接上传   
	    				$("#wenjian").submit();
	    			}else{
	    				 layer.confirm('存在重复文件！是否覆盖？', {
	    			    	 btn: ['覆盖','取消'] //按钮
	    			    	}, function(){
	    			    		 layer.msg('覆盖成功！',{offset: 320,icon: 1,time:2000});
	    			    		 $('#addfilemodle').modal('hide');
	    			    		 
	    			    	}, function(){
	    			    		layer.msg('本次上传已取消！',{offset: 320,icon: 1,time:2000});
	    			    		$('#addfilemodle').modal('hide');
	    			    	});	
	    			}
	    		},
	    		error: function(req){
	    			layer.msg("请联系管理员！",{offset:320,icon: 5});
	    			}
	    	});
	}
} 
