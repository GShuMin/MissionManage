<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>项目管理系统</title>
		<link href="css/css.css" rel="stylesheet" type="text/css"/>
	 	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="js/base.js"></script>
		<script src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/cookie_util.js"></script>
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		-->
		</style>
	
		<script type="text/javascript">
			var SUCCESS = 1;
			function CheckLogin(){
				//获取参数
				var uname=$("#uname").val();
				var upwd=$("#upwd").val();
				//进行简单的判断
				var ok=true;
				if(uname==""){
					ok=false;
					$("#login_error").html("请正确输入用户姓名!");
				}
				if(upwd==""){
					ok=false;
					$("#login_error2").html("请正确输入用户密码!");
				}
				if(ok){
					$.ajax({
						url:path+"/CheckLogin.do",
						type:"post",
						data:{"name":uname,"password":upwd},
						dataType:"json",
						success:function(d){
							if(d.status==SUCCESS){   //用户校验成功，跳转到主页面
								window.location.href="toMain.do";
								addCookie("pwd",password);
							}else{
								$("#login_error").html(d.msg);
							}
						},
						error:function(){
							alert("登录失败");
						}
					});
				}
			}
			function toLogin(){
				window.location.href="toLogin.do";
			}
		</script>
	</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="images/top02.gif"><img src="images/top03.gif" width="776" height="147" /></td>
  </tr>
</table>
<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
      
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          <tr>
            <td align="center"><img src="images/ico13.gif" width="107" height="97" /></td>
          </tr>
          <tr>
            <td height="40" align="center">&nbsp;</td>
          </tr>
          
        </table></td>
        <td><img src="images/line01.gif" width="5" height="292" /></td>
      </tr>
    </table></td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="31%" height="35" class="login-text02">用户名称：<br /></td>
        <td width="69%"><input name="textfield" type="text" size="30" id="uname" /></td>
      </tr>
      <tr>
      	<td></td>
      	<td style="color:red;font-size:10px;margin-top:10px;" id="login_error"></td>
      </tr>
      <tr>
        <td height="35" class="login-text02">密　码：<br /></td>
        <td><input name="textfield2" type="password" size="33" id="upwd" /></td>
      </tr>
      <tr>
      	<td></td>
      	<td style="color:red;font-size:10px;margin-top:10px;" id="login_error2"></td>
      </tr>
      <tr>
        <td height="35">&nbsp;</td>
        <td><input name="Submit2" type="button" class="right-button01" value="确认登陆" onClick="CheckLogin()" />
          <input name="Submit232" type="button" class="right-button02" value="重 置" onClick="toLogin()"/></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>