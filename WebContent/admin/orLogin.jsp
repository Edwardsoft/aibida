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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组织登录</title>
</head>
<body align="center">
  <div width="">
    <input name="username" type="text" placeholder="请输入用户名">
    <input name="password" type="password" placeholder="请输入密码" >
    <button id="login">登录</button>
  </div>
<script src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $("#login").addClass("active");
    $("button[name='submit']").click(function(){
      var username=$("input[name='username']").val();
      var password=$("input[name='password']").val();
      if(username.trim()==""||username.trim()==null) {
        $("#username_error").html("用户名不能为空！");
      }else if(password.trim()==""||password.trim()==null) {
        $("#password_error").html("密码不能为空！");
      }else {
        $("#username_error").html("");
        $("#password_error").html("");
        $.post(
          "UserAction_login",
          {username:username.trim(),password:password.trim()},
          function(data) {
            if(data=="false")   {
              $("#username_error").html("登录失败，您输入的用户名或密码错误");
            }else {
              $("#username_error").html("登录成功，3秒后跳转至之前的页面");
              location.href="Index";
            }
          }
        );
      }
    });
    $("#login").click(function(){
      location.href="Login";
    });   
  });
</script>
</body>
</html>