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
<body>
  <div class="container">
  <%@ include file="../head.jsp" %>
  <div class="col-sm-2"></div>
  <form class="form-horizontal col-sm-8" role="form" id="login_form">
    <div class="form_title col-sm-12">登录</div>
    <div class="form-group">
      <div class="col-sm-3"></div>
      <label for="InputUsername" class="contaol-label col-sm-2">用户名</label>
      <div class="col-sm-4">
        <input type="text" class="form-control login_input" id="InputUsername" placeholder="请输入用户名/邮箱/手机号" name="username" id="username">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-3"></div>
      <label for="InputPassword" class="contaol-label col-sm-2">密码</label>
      <div class="col-sm-4">
        <input type="password" class="form-control login_input" id="InputPassword" placeholder="请输入密码" name="password" id="password">
      </div>
      <div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-7"><span id="username_error" style="color:red;"></span></div>
      </div>
      <div class="row col-sm-12" style="margin:10px 0px;">
         <div class="col-sm-4"></div>
         <div class="col-sm-2"><a href="Login"><input type="radio" name="type" id="login"></a>个人用户</div>
         <div class="col-sm-2"><a href="orLogin"><input type="radio" checked="checked" name="type" id="orlogin"></a>公益组织</div>
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