<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/amazeui.flat.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script src="js/one.js"></script>
<script type="text/javascript">

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>爱必达注册</title>
<style>



</style>
</head>
<body>
<div class="container">
	<%@ include file="head.jsp" %>
	<div class="col-sm-2"></div>
	<form class="form-horizontal col-sm-8" role="form" id="register_form">
		<div class="form_title col-sm-12">注册</div>
		<div class="form-group row">
			<div class="col-sm-3"></div>
			<label for="InputUsername" class="contaol-label col-sm-2">用户名</label>
			<div class="col-sm-4">
				<input type="text" class="form-control login_input" id="InputUsername" placeholder="请输入用户名" name="username" id="username">
			</div>
			<div class="row">
			  <div class="col-sm-5"></div>
        <div class="col-sm-4"><span id="username_error" style="color:red;"></span></div>
			</div>
			
		</div>
		
		<div class="form-group row">
			<div class="col-sm-3"></div>
			<label for="InputPassword" class="contaol-label col-sm-2">密码</label>
			<div class="col-sm-4">
				<input type="password" class="form-control login_input" id="InputPassword" placeholder="请输入密码" name="password" id="password">
			</div>
			<div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-4"><span id="password_error" style="color:red;"></span></div>
      </div>
		</div>
		 
		<div class="form-group row" >
			<div class="col-sm-3"></div>
			<label for="RepeatPassword" class="contaol-label col-sm-2">确认密码</label>
			<div class="col-sm-4">
				<input type="password" class="form-control login_input" id="RepeatPassword" placeholder="请再次输入密码" name="repeatpassword" id="password">
			</div>
			<div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-4"><span id="repeatpassword_error" style="color:red;"></span></div>
      </div>	
		</div>
		
		<div class="form-group row" >
			<div class="col-sm-3"></div>
			<label for="email" class="contaol-label col-sm-2">邮箱</label>
			<div class="col-sm-4">
				<input type="email" class="form-control login_input" id="email" placeholder="请输入您的邮箱" name="email" id="password">
			</div>
			<div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-4"><span id="email_error" style="color:red;"></span></div>
      </div>	
		</div>

		<div class="form-group row" style="height: 40px">
			<div class="col-sm-5"></div>
			<div class="col-sm-2">
				<button type="button" class="btn btn-default" name="submit">注册</button>
			</div>
			<div class="col-sm-5"></div>
		</div>
		
		<div class="form-group">
      <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
          <hr style="border-bottom:1px solid green;position:relative;top:10px;"/>
        </div>
        <div class="col-sm-2" align="center" style="color:green;">
          社交账号登录
        </div>
        <div class="col-sm-2">
          <hr style="border-top:1px solid green;position:relative;top:10px;" />
        </div>
        <div class="col-sm-3"></div>
      </div>
      <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-2" align="center">
          <a href="SocialLogin?type=qq" class="am-icon-qq" style="font-size: 40px;" title="qq登录"></a>
        </div>
        <div class="col-sm-2" align="center" >
          <a href="SocialLogin?type=wechat" class="am-icon-weixin" style="font-size: 40px;" title="微信登录"></a>
        </div>
        <div class="col-sm-2" align="center">
          <a href="SocialLogin?type=microblog" class="am-icon-weibo" style="font-size: 40px;" title="微博登录"></a>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
    </div>
		
		
	</form>
	<div class="col-sm-2"></div>
</div>

<script type="text/javascript">
	var username;
	var password;
	var email;
	var usernamestatus=0;
	var passwordstatus=0;
	var repeatpasswordstatus=0;
	var emailstatus=1;
	var email=$.trim($("input[name='email']").val());
	var telephone=$.trim($("input[name='telephone']").val());
	function checkusername() {
		var re=new RegExp("^[a-zA-Z][a-zA-Z0-9_]{4,15}$");
		username=$("input[name='username']").val();
		if(username==null||username=="") {
			$("input[name='username']").parent().parent().removeClass("has-warning");
			$("input[name='username']").parent().parent().addClass("has-error");
			$("#username_error").html("用户名不能为空！");
			usernamestatus=0;
		}else if(username.length<6){
			$("input[name='username']").parent().parent().removeClass("has-error");
			$("input[name='username']").parent().parent().addClass("has-warning");
			$("#username_error").html("用户名长度不得低于六位");
			usernamestatus=0;
		}else if(!re.test(username)) {
			$("input[name='username']").parent().parent().removeClass("has-error");
			$("input[name='username']").parent().parent().addClass("has-warning");
			$("#username_error").html("用户名首只能以字母开头，只允许字母数字下划线，允许5-16位");
			usernamestatus=0;
		}else {
			$("#username_error").html("");
			$.post(
				"UserAction_checkUserName",
				{username:username},
				function(data) {
					if(data=="false") {
						$("input[name='username']").parent().parent().removeClass("has-error");
						$("input[name='username']").parent().parent().removeClass("has-warning");
						$("#username_error").html("恭喜你，该用户名可以使用！");
						usernamestatus=1;
					}else {
						$("input[name='username']").parent().parent().addClass("has-error");
						$("#username_error").html("很遗憾，该用户名已被占用");
						usernamestatus=0;
					}
				}
			)
		}
	}
	
	function checkpassword() {
		var re=new RegExp("^[a-zA-Z][a-zA-Z0-9_]{4,15}$");
		password=$("input[name='password']").val();
		if(password==null||password=="") {
			$(this).parent().parent().addClass("has-error");
			$("#password_error").html("密码不能为空！");
			passwordstatus=0;
		}else if(password.length<6){
			$(this).parent().parent().removeClass("has-error");
			$(this).parent().parent().addClass("has-warning");
			$("#password_error").html("用户名长度不得低于六位");
			passwordstatus=0;
		}else if(!re.test(password)) {
			$(this).parent().parent().removeClass("has-error");
			$(this).parent().parent().addClass("has-warning");
			$("#password_error").html("密码只允许字母数字下划线，允许5-16位");
			passwordstatus=0;
		}else {
			$("#password_error").html("");
			$(this).parent().parent().removeClass("has-error");
			$(this).parent().parent().removeClass("has-warning");
			passwordstatus=1;
		}
	}
	
	function checkrepeatpassword() {
		password=$("input[name='password']").val();
		var repeatpassword=$("input[name='repeatpassword']").val();
		if(repeatpassword!=password) {
			$("#repeatpassword_error").html("两次输入的密码不一致");
			repeatpasswordstatus=0;
		}else {
			$("#repeatpassword_error").html("");
			repeatpasswordstatus=1;
		}
	}
	
	function checkemail() {
		var emailgre=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/; 
		email=$("input[name='email']").val();
		if(email!=""&&email!=null) {
			if(!emailgre.test(email)) {
				$("#email_error").html("邮箱格式不正确");
				emailstatus=0;
				$("input[name='email']").parent().parent().addClass("has-error");
			}else {
				$.post("Email?method=isused",
						{email:email},
						function(data){
							if(data=="true") {
								$("#email_error").html("该邮箱已被占用，请更换邮箱！");
								emailstatus=0;
							}else {
								$("#email_error").html("");
								emailstatus=1;
								$("input[name='email']").parent().parent().removeClass("has-error");
							}
						});				
			}
		}else {
			$("email_error").html("");
			emailstatus=1;
			$("input[name='email']").parent().parent().removeClass("has-error");
		}
	}
	
	$(document).ready(function(){
		$("#register").addClass("active");
		$("input[name='username']").blur(function(){
			checkusername();
		});
		$("input[name='password']").blur(function(){
			checkpassword();
		});
		
		$("input[name='repeatpassword']").blur(function(){
			checkrepeatpassword();
		});
		
		$("input[name='email']").blur(function(){
			checkemail();
		})
		$("button[name='submit']").click(function(){
			checkusername();
			checkpassword();
			checkrepeatpassword();
			checkemail();
			$("#username_error").html("");
			if(usernamestatus&&passwordstatus&&repeatpasswordstatus&&emailstatus) {
				if(email!=null&&email!="") {
					$.post(
							"UserAction_register",
							{username:username,password:password,email:email},
							function(data) {
								alert("注册成功");
								location.href="UserAction_checkEmail";
							}
					); 
				}else {
					$.post(
							"doregister",
							{username:username,password:password},
							function(data) {
								alert("注册成功");
							}
					); 
				}
				
			}
		})
	});
</script>
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/docs.js"></script>
<script src="js/view.js"></script>
</body>
</html>