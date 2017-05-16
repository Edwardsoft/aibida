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
<script src="js/one.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公益组织登录</title>
<style>
  * {
    font-family:微软雅黑; 
  }
  .login .head {
    top:25px;
    position:absolute;
    width:100%;
    height:40px;
    font-size:22px;
    text-align:center;
    color:green;
  }
  
  .login {
    width:780px;
    left:25%;
    top:150px;
    height:500px;
    position:absolute;
    display:block;
    background-color:white;
    border-radius:10px;
    border:1px solid #e4e4e4;
  }
  username,password,jizhu {
    display:block;
    position:absolute;
    width:390px;
    left:195px;
    
  }
  username {
    top:100px;
    line-height:30px;
  }
  password {
    top:170px;
    line-height:30px;
  }
  jizhu {
    top:250px;
  }
  .input {
    position:absolute;
    right:50px;
    width:200px;
    height:30px;
    border-radius:15px;
    border:none;
    background-color:#f2f2f2;
  }
  .text {
    position:absolute;
    left:50px;
  }
  jizhu input{
    position:absolute;
    left:130px;
  }
  .wangji {
    position:absolute;
    right:50px;
  }
  jizhu .text {
    position:absolute;
    left:150px;
  }
  login {
    position:absolute;
    width:250px;
    left:270px;
    top:310px;
    background-color:orange;
    text-align:center;
    height:35px;
    line-height:35px;
    border-radius:17.5px;
    cursor:pointer;
  }
  fenge {
    width:215px;
    display:block;
    left:287.5px;
    height:30px;
    position:absolute;
    top:370px;
    text-align:center;
    color:green;
  }
  .hr_left,.hr_right{
    position:absolute;
    top:12px;
    width:50px;
    display:inline;
    height:1px;
    border:none;
    border-top:1px solid green;
  }
  .hr_left {
    left:0px;
  }
  .hr_right {
    right:0px;
  }
  error {
    position: absolute;
    top:220px;
    color:red;
    width:250px;
    left:270px;
    text-align:center;
  }
  #login_form {
    border:1px solid #e4e4e4;
    border-radius:10px;
  }
  
  .form_title {
    text-align: center;
    height: 75px;
  }
  
  .form-group {
    height: 100px;
  }
  
  button {
    width:100px;
  }
  a.am-icon-qq:link {
    color:black;
  } 
  a.am-icon-qq:visited {
    color:red;
  } 
  a.am-icon-qq:hover {
    color:yellow;
  } 
</style>
<script type="text/javascript">

</script>
</head>
<body>

<div class="container">
  <%@ include file="head.jsp" %>
  <div class="col-sm-2"></div>
  <form class="form-horizontal col-sm-8" role="form" id="login_form">
    <div class="form_title col-sm-12"><h3>登录</h3></div>
    <br/>
    <div class="form-group">
      <div class="col-sm-3"></div>
      <label for="InputUsername" class="contaol-label col-sm-2">用户名</label>
      <div class="col-sm-4">
        <input type="text" class="form-control login_input" id="InputUsername" placeholder="请输入用户名/邮箱/手机号" name="username" id="username">
      </div>
      <div class="col-sm-3"><span id="username_error" style="color:red;"></span></div>
    </div>
    <div class="form-group">
      <div class="col-sm-3"></div>
      <label for="InputPassword" class="contaol-label col-sm-2">密码</label>
      <div class="col-sm-4">
        <input type="password" class="form-control login_input" id="InputPassword" placeholder="请输入密码" name="password" id="password">
      </div>
      <div class="col-sm-3"><span id="password_error" style="color:red;"></span></div>
      
      <div class="row col-sm-12" style="margin:10px 0px;">
         <div class="col-sm-4"></div>
         <div class="col-sm-2"><input type="radio" name="type" id="gelogin">个人用户</div>
         <div class="col-sm-2"><input type="radio" checked="checked" name="type" id="orlogin">公益组织</div>
         <div class="col-sm-4"></div>
      </div> 
      <div class="row col-sm-12">
        <div class="col-sm-4"></div>
        <div class="col-sm-3">
           <div class="checkbox">
             <label>
               <br/>
               <input type="checkbox">记住我
             </label>
           </div>
         </div>
         <div class="col-sm-2">
           <a href="" style="text-align:right;"><br/>忘记密码？</a>
         </div>
         <div class="col-sm-4"></div>
      </div>    
    </div>
    <div class="form-group" style="height: 40px">
      <div class="col-sm-5"></div>
      <div class="col-sm-1">
        <button type="button" class="btn btn-default" name="submit">登录</button>
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


<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/docs.js"></script>
<script src="js/view.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
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
          "UserServlet",
          {username:username.trim(),password:password.trim(),method:'login'},
          function(data) {
            if(data=="false") {
              $("#username_error").html("登录失败，您输入的用户名或密码错误");
            }else {
              $("#username_error").html(data+"，登录成功，3秒后跳转至之前的页面");
              location.href="index.jsp";
            }
          }
        );
      }
    });
    $("#gelogin").click(function() {
        location.href="login"
     });
    
    
  });
</script>
</body>
</html>