<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>项目管理系统</title>
		<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
		<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/base.js"></script>
		<script src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/cookie_util.js"></script>

		<script language="JavaScript" type="text/javascript">
			$(function(){
				//加载执行人
				loadZX();
				//加载客户公司
				loadCompany();
				
			});
			function loadZX(){
				$.ajax({
					url:path + "/loadZX.do",
					type:"post",
					dataType:"json",
					success:function(d){
						if(d.status == 0){
							var user = d.data;
							for(var i=0;i<user.length;i++){
								var uname = user[i].uname;
								var uid = user[i].uid;
								var option = "";
								option += " <option value='"+uid+"'>"+uname+"</option>";
								$("#zx").append(option);
							}
							
						}
					},
					error:function(){
						alert("加载失败");
					}
				})
			}
			function loadCompany(){
				$.ajax({
					url:path + "/loadCompany.do",
					type:"post",
					dataType:"json",
					success:function(d){
						if(d.status == 0){
							var company = d.data;
							for(var i=0;i<company.length;i++){
								var cname = company[i].cname;
								var cid = company[i].cid;
								var option = "";
								option += " <option value='"+cid+"'>"+cname+"</option>";
								$("#company").append(option);
							}
							
						}
					},
					error:function(){
						alert("加载失败");
					}
				})
			}
		function tishi()
		{
		  var a=confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
		  if(a!=true)return false;
		  window.open("冲突页.htm","","depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
		}
		
		function check()
		{
		document.getElementById("aa").style.display="";
		}
		
		
		function link(){
			 var a=confirm('确认保存吗');
			 if(a == true){
				 //获取信息
				 var uid ="<%=session.getAttribute("uid")%>";
				 var mname = $("#mname").val();
				 var mtime = $("#mtime").val();
				 var mstime = $("#mstime").val();
				 var metime = $("#metime").val();
				 var cid = $("#company").val();
				 var mjieshao = $("#mjieshao").val();
				 var fuid = $("#zx").val();
				 var speed = $("#speed").val();
				 var mjieshao = $("#mjieshao").val();
				 console.log(mjieshao);
				 var ok = true;
				 if(mname == ""){
					 ok = false;
					 alert("请填写项目名称");
				 }
				 if(mtime == ""){
					 ok = false;
					 alert("请填写项目工期");
				 }
				 if(mstime == ""){
					 ok = false;
					 alert("请选择开始时间");
				 }
				 if(metime == ""){
					 ok = false;
					 alert("请选择结束时间");
				 }
				 if(cid == ""){
					 ok = false;
					 alert("请选择客户");
				 }
				 if(fuid == ""){
					 ok = false;
					 alert("请选择执行人");
				 }
				 if(mjieshao == ""){
					 ok = false;
					 alert("请填写项目介绍");
				 }
				 if(speed == "==请选择=="){
					 ok = false;
					 alert("请选择优先级");
				 }
				 if(ok == true){
					 $.ajax({
						 url:path + "/addRenwu.do",
							type:"post",
							data:{"mname":mname,"mtime":mtime,"mstime":mstime,"metime":metime,"cid":cid,"uid":fuid,"fuid":uid,"mjieshao":mjieshao,"speed":speed},
							dataType:"json",
							success:function(d){
								alert("添加成功");
								window.location.href="toRenwu.do";
							},
							error:function(){
								alert("添加失败");
							}
						
						 
					 });
				 }
				
			 }
		}
		
		
		
		</script>
		<style type="text/css">
		<!--
		.atten {font-size:12px;font-weight:normal;color:#F00;}
		-->
		</style>
</head>

<body class="ContentBody">
  <form action="" method="post" enctype="multipart/form-data" name="fom" id="fom" target="sypost" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >任务添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		</td></tr>

		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加任务</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="13%" >任务标题:</td>
					    <td width="41%"><input name="text" id="mname" class="text" style="width:250px" type="text" size="40" />
				        <span class="red"> *</span></td>
					    <td align="right" width="19%" >工期:</td>
					    <td width="27%"><input name="Input22" id="mtime" class="text" style="width:154px" /></td>
					    </tr>
					  <tr>
					    <td nowrap align="right">计划开始时间:</td>
					    <td><input name="" id="mstime" class="text" type="date" style="width:154px" /></td>
					    <td align="right">计划结束时间:</td>
					    <td><input name="Input" id="metime" class="text" type="date" style="width:154px" /></td>
					  </tr>
					   <tr>
					    <td nowrap align="right">任务执行人:</td>
					    <td><select name="select2" id="zx">
                          <option  selected="selected">==请选择==</option>
                          
                        </select></td>
					    <td align="right">优先级:</td>
					    <td><select name="select" id="speed">
                          <option  selected="selected">==请选择==</option>
                          <option value="暂不">暂不</option>
                          <option value="一般">一般</option>
                          <option value="需要">需要</option>
                          <option value="急">急</option>
                          <option value="很急">很急</option>
                        </select></td>
					  </tr>
					  <tr>
					    <td nowrap align="right">客户:</td>
					    <td><select name="select3" id="company" >
                          <option  selected="selected">==请选择==</option>
                          
                        </select></td>
					    
					   
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">任务说明:</td>
					    <td colspan="3"><input type="text" id="mjieshao" style="width:360px; height:80px;" ></td>
					    </tr>
					  </table>
			 <br />
				</fieldset>			</TD>
		</TR>
		
		</TABLE>
	
	
	 </td>
  </tr>
  

		
		
		
		
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="button" name="Submit" value="保存" class="button" onclick="link();"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>
	
	
	 </td>
  </tr>
  
  
  
  
  </table>

</div>
</form>
</body>
</html>
