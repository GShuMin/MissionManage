<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>项目管理系统</title>
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.tabfont01 {	
		font-family: "宋体";
		font-size: 9px;
		color: #555555;
		text-decoration: none;
		text-align: center;
	}
	.font051 {font-family: "宋体";
		font-size: 12px;
		color: #333333;
		text-decoration: none;
		line-height: 20px;
	}
	.font201 {font-family: "宋体";
		font-size: 12px;
		color: #FF0000;
		text-decoration: none;
	}
	.button {
		font-family: "宋体";
		font-size: 14px;
		height: 37px;
	}
	html { overflow-x: auto; overflow-y: auto; border:0;} 
	-->
	</style>
	
	<link href="css/css.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
			<script type="text/javascript" src="js/base.js"></script>
			<script src="js/jquery.min.js"></script>
			<script type="text/javascript" src="js/cookie_util.js"></script>
	<script type="text/JavaScript">
		$(function(){
			//加载任务
			loadRenwu();
			loadZX();
		});
		function chakan(mid){
			addCookie("mid",mid);
			window.location.href="toListRenwu.do";	
			
		
		}
		
		function findByUid(uid,i){
			var uname;
			$.ajax({
				url:path + "/findByUid.do",
				type:"post",
				data:{"uid":uid},
				dataType:"json",
				success:function(d){
					uname = d.data;
					
					$("#uname"+i+"").html(uname);
					
				}
				
				
			});
		}
		
		
		function findByUid2(fuid,i){
			$.ajax({
				url:path + "/findByUid.do",
				type:"post",
				data:{"uid":fuid},
				dataType:"json",
				success:function(d){
					var funame = d.data;
					$("#funame"+i).html(funame);
					
				}
				
				
			});
		}
		
		function del(mid){
			
				$.ajax({
					url:path + "/delRenwu.do",
					type:"post",
					data:{"mid":mid},
					dataType:"json",
					success:function(d){
						if(d.status == 0){
							history.go(0);
						}
					},
					error:function(){
						alert("删除失败");
					}
					
				});
			}
			
		
		function update(mid){
			addCookie("mid",mid);
			window.location.href="toUpdate.do";	
		}
		
	
		function loadRenwu(){
			$.ajax({
				url:path + "/loadRenwu.do",
				type:"post",
				dataType:"json",
				success:function(d){
					if(d.status == 0){
						var mission = d.data;
						for(var i=0;i<mission.length;i++){
							var mname = mission[i].mname;
							var mstime = mission[i].mstime;
							var uid = mission[i].uid;
							var fuid = mission[i].fuid;
							findByUid(uid,i);
							findByUid2(fuid,i);
							var speed = mission[i].speed;
							var mid = mission[i].mid;
							var tr = "";
							tr +="<tr bgcolor='#FFFFFF'>";
							tr +="	<td height='20'><input type='checkbox' class='check1' value='"+mid+"' id='checked"+i+"'/></td>";
							tr +="	<td ><a href='listmokuaimingxi.htm' onclick=''></a>"+mname+"</td>";
							tr +="	<td>"+mstime+"</td>";
							tr +="	<td id='uname"+i+"'></td>";
							tr +="	<td id='funame"+i+"'></td>";
							tr +="	<td>"+speed+"</td>";
							tr +="	<td><a href='javascript:update("+mid+");'>编辑|</a><a href='javascript:chakan("+mid+");'>查看|</a>";
							tr +="	<a href='javascript:del("+mid+");'>删除</a></td>";
							tr +="</tr>";
							$("#bg").append(tr);
			                  
						}
						
					}
				},
				error:function(){
					alert("加载失败");
				}
			});
		
		}
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
		function chaxun(){
			$("#bg").empty();
			//获取vaule值
			var uid = $("#zx").val();
			var tr1 = "";
			tr1 += "<tr class='CTitle' >";
			tr1 += "	<td height='22' colspan='7' align='center' style='font-size:16px'>任务详细列表</td>";
			tr1 += "	</tr>";
			tr1 += "	 <tr bgcolor='#EEEEEE'>";
			tr1 += "	 <td width='4%' align='center' height='30'>选择</td>";
			tr1 += "	 <td width='10%'>任务标题</td>";
			tr1 += "	 <td width='10%''>开始时间</td>";
			tr1 += "	<td width='10%'>执行人</td>";
			tr1 += "	<td width='10%'>发送人</td>";
			tr1 += "	<td width='5%'>优先级</td>";
			tr1 += "	<td width='12%'>操作</td>";
			tr1 += "</tr>";
			$("#bg").append(tr1);
			if(uid == "==请选择=="){
				loadRenwu();
			}else{
				
				$.ajax({
					url:path + "/chaxun.do",
					type:"post",
					data:{"uid":uid},
					dataType:"json",
					success:function(d){
						if(d.status== 0){
							var mission = d.data;
							for(var i =0;i<mission.length;i++){
								var mname = mission[i].mname;
								var mstime = mission[i].mstime;
								var uid = mission[i].uid;
								var fuid = mission[i].fuid;
								findByUid(uid,i);
								findByUid2(fuid,i);
								var speed = mission[i].speed;
								var mid = mission[i].mid;
								var tr = "";
								tr +="<tr bgcolor='#FFFFFF'>";
								tr +="	<td height='20'><input class='check1' value='"+mid+"' id='checked"+i+"' type='checkbox'/></td>";
								tr +="	<td ><a href='listmokuaimingxi.htm' onclick=''></a>"+mname+"</td>";
								tr +="	<td>"+mstime+"</td>";
								tr +="	<td id='uname"+i+"'></td>";
								tr +="	<td id='funame"+i+"'></td>";
								tr +="	<td>"+speed+"</td>";
								tr +="	<td><a href='javascript:update("+mid+");'>编辑|</a><a href='javascript:chakan("+mid+");'>查看|</a>";
								tr +="	<a href='javascript:del("+mid+");'>删除</a></td>";
								tr +="</tr>";
								$("#bg").append(tr);
							
							}
							}
			
			
						
					}
				
			});
		}
		}
		function selectAll(){
			$(".check1").prop("checked",true);
			
			
		}
		function unselectAll(){
			$(".check1").prop("checked",false);
		}
		function delAll(){
			//查找选中的mid
			var obj = $(".check1");
			mid = [];
			for(i in obj){
		        if(obj[i].checked)
		        	mid.push(obj[i].value);
		    }
			if(mid.length == 0){
				alert("请勾选要删除的任务");
				return;
			}else{
				//删除选中的商品
				for(var i = 0; i < mid.length; i++){
					del(mid[i]);
				}
				
			}
		}
	</script>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	</head>
<SCRIPT language=JavaScript>
	function link(){
	   window.location.href="toAddrw.do";
	}

</SCRIPT>

<body>
<div name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21"><img src="images/ico07.gif" width="20" height="18" /></td>
			  <td width="120">查看内容：执行人：
			  <td><select name="textfield" id="zx">
               <option  selected="selected">==请选择==</option>
               </select>
               <input name="Submit4" type="button" onclick="chaxun();" class="right-button02" value="查 询" />
               </td>
					<!-- <input name="textfield" type="text" size="12" readonly="readonly"/>
					<span class="newfont06">至</span>
					<input name="textfield" type="text" size="12" readonly="readonly"/> -->
					
			   	
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="20"><span class="newfont07">选择：<a href="javascript:selectAll();" class="right-font08" >全选</a>-<a href="javascript:unselectAll();" class="right-font08">反选</a></span>
	              <input name="Submit" type="button" class="right-button08" value="删除所选任务" onclick="delAll();" />
	              <input name="Submit2" type="button" class="right-button08" value="添加任务" onclick="link();"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table width="100%" border="0" id="bg" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    	<td height="22" colspan="7" align="center" style="font-size:16px">任务详细列表</td>
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">选择</td>
                    <td width="10%">任务标题</td>
					<td width="10%">开始时间</td>
                    <td width="10%">执行人</td>
					<td width="10%">发送者</td>
					<td width="5%">优先级</td>
					<td width="12%">操作</td>
                  </tr>
                 
				  
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <!-- <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span class="right-text09">5</span> 页 | 第 <span class="right-text09">1</span> 页</td>
                <td width="49%" align="right">[<a href="#" class="right-font08">首页</a> | <a href="#" class="right-font08">上一页</a> | <a href="#" class="right-font08">下一页</a> | <a href="#" class="right-font08">末页</a>] 转至：</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input name="textfield3" type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value=" " />
                      </td> -->
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</div>
</body>
</html>
