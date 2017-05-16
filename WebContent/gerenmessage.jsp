<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.1.0.min.js" ></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript">
	
</script>
<title>爱必达</title>
<style>
	mulu {
		position: absolute;
		border:1px solid #e4e4e4;	
		top:15%;
	}
	mulu a {
		position:relative;
		line-height: 40px;
		left:20%;
		top:5%;
	}
	touxiang {
		position: absolute;
		border:1px solid #e4e4e4;
	}
	touxiang img {
		position: absolute;
		top:2px;
		left: 2px;
	}
	jutixinxi {
		position: absolute;
		border:1px solid #e4e4e4;
		line-height: 28px;
	}
	jichuxinxi table {
		position: relative;
		top:30px;
		left:50px;
	}
	jichuxinxi hr {
		position:relative;
		border:none;
		border-bottom:1px solid #e4e4e4;
		width:90%;
		top:40px;
		left:50px;
	}
	
	anquanfuwu {
		position: relative;
		top:50px;
		left:50px;
	}
	#xiugai {
		color:orange;
	}
</style>
</head>
<body>
	<%@ include file="head.jsp" %>
	<touxiang>
		<img src="img/touxiang.jpg"/>
	</touxiang>
	<mulu>
		<a href="">安全设置</a>
		<br/>
		<a href="">个人资料</a>
		<br/>
		<a href="">个人成长信息</a>
		<br/>
		<a href="">微博绑定设置</a>	
		<br/>
		<a href="">QQ绑定设置</a>
	</mulu>
	<jutixinxi>
		<jichuxinxi>
			<table>
				<tr>
					<th>您的基础信息</th>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>会员名</td>
					<td>${user.userName }</td>
					<td><a  id="xiugai" href="">修改用户名</a></td>
				</tr>
				<tr>
					<td>登陆邮箱：</td>
					<td>${user.email }</td>
					<td><a id="xiugai" href="">修改邮箱</a></td>
				</tr>
				<tr>
					<td>绑定手机：	</td>
					<td>${user.telephone}</td>
					<td><a id="xiugai" href="">修改手机</a></td>
				</tr>
			</table>
			<hr/>
		</jichuxinxi>
		<anquanfuwu>
			<b>您的安全服务</b>
			
		</anquanfuwu>
	</jutixinxi>
</body>
</html>