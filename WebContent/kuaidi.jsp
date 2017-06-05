<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>快递查询接口</title>
</head>
<body>
    <input type="text" name="id" id="order_id" />
    <select id="order">
      <option value="SF">顺丰</option>
      <option value="EMS">EMS</option>
      <option value="HHTT">天天</option>
      <option value="ZTO">中通</option>
      <option value="YTO">圆通</option>
      <option value="STO">申通</option>
      <option value="HTKY">百世快递</option>
    </select>
    <button id="submit">提交查询</button>
  <div >
    <div>
      结果：
    </div>
    <div id="result">
      
    </div>
  </div>
</body>
<script type="text/javascript" src="js/jquery-3.1.0.min.js" ></script>
<script type="text/javascript">
    $(document).ready(function(){
    	  $("#submit").click(function(){
    		  var order=$("#order").val();
    		  var id=$("#order_id").val();
    		  $.post(
 		          "ExpressAction",
 		          {ShipperCode:order,LogisticCode:id},
 		          function(data) {
 		        	  alert(data);
 		        	  var data=eval("("+data+")");
 		        	  if(data.State==2) {
 		        		  alert(data.Traces);
	                $.each(data.Traces, function(i, item){
	                  $("#result").append(item.AcceptTime);
	                  $("#result").append(item.AcceptStation);
	                 $("#result").append("<br/>");
	                });
 		        	  }else {
 		        		  alert("没有查询到数据，请检查你输入的运单号");
 		        	  }
 		        	  
 		          }
 		      );
    	  });
    });
</script>
</html>