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
	    ,url: path+'/user/selectAllUserZX'
	    ,totalRow: true
	    ,loading: true
	    ,cols: [[     
	     {checkbox : true,field:'id', title:'', width:80, fixed: 'left',LAY_CHECKED : false}
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
	  	

	   
});



