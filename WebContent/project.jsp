<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<HTML>
  <head>
    <meta charset="utf-8">
    
    <link href="css/bootstrap.min.css"  rel="stylesheet"/>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>
    <link href="css/theme.css" rel="stylesheet">
    <script src="js/one.js"></script>
    <style type="text/css">
      #donate_message{
        background: rgba(20,20,20,1);
        position: fixed;
        width:30%;
        height:60px;
        text-align: center;
        font-size:20px;
        left:35%;
        top:55%;
        z-index:1000;
        color:white;
        line-height:55px;
        display: none;
      }
    </style>
  </head>
  
  <body>
      <div id="donate_message">
        <span class="glyphicon glyphicon-remove-circle">
           您还没有选择捐赠的物品
        </span>
      </div>
      <div id="donate_page" class=" row col-sm-12" style="color:white;position:fixed;width: 100%;height: 100%;background-color:transparent;z-index:999;display: none;">
        <div class="col-sm-2"></div>
        <div class="col-sm-8" style="background-color:rgba(28,28,28,0.8);height:90%;">
          <div style="position: absolute;right: 0px;padding:5px;"><a class="glyphicon glyphicon-remove" id="donate_page_remove"></a></div>
          
          <div class="row col-sm-12">
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
              <div style="width:100%;height:100%;display: block;position:absolute;" id="step_one" >
	              <div class="row col-sm-12" style="margin-bottom:10px;color:white;text-align: center;font-size:24px;padding:5px;">请完成捐赠信息填写</div>
	              <div class="row col-sm-12" style="font-size:18px;">物品清单</div>
	              <div class="item_lists">
	              <c:forEach items="${items}" var="item">
	                <c:if test="${item.remain_amount>0}">
	                  <div class="col-sm-2 item_list" amount="${item.remain_amount}" style="background-color: rgb(28,28,28);cursor: pointer;text-align: center;margin: 5px;padding: 5px;" sign="${item.id}"> ${item.name}</div>
	                </c:if>
	              </c:forEach> 
	              </div>
	              <div class="row col-sm-12" style="font-size:18px;">已认领</div>
	              <div class="row col-sm-12" style="">
	                <table class="table" id="item_form">
	                  <tr><td>物品名</td><td>认捐数量</td><td>剩余需求数量</td></tr>
	                </table>
	              </div>
	              <div class="row col-sm-12" style="">
	                <div class="col-sm-5"></div>
	                <div class="col-sm-2" style="background-color: rgb(28,28,28);cursor: pointer;text-align: center;margin: 5px;padding: 5px;" id="donate_form_click">提交认捐表</div>
	                <div class="col-sm-5"></div>
	              </div>
              </div>
              <div style="width:100%;height: 100%;display: none;" id="step_two"> 
                <div class="row col-sm-12" style="margin-bottom:10px;color:white;text-align: center;font-size:24px;padding:5px;">请选择捐赠方式</div>
                <div class="row col-sm-12">
                  <div class="col-sm-3 donate_type" style="border:1px solid #e4e4e4;cursor: pointer;min-height:230px;" status="0" type="1">
                    
                    <div class="col-sm-12" style="text-align: center;padding:10px 0px;font-size:16px;">工作人员上门验收</div>
                    <div class="col-sm-12" style="padding:0px;text-indent:2em;">
                      <p>选择此方式，我们将会尽快派工作人员前往您提供的地址验收您所要捐赠的物品</p>
                    </div>
                    <div class="click_ok" style="display:none;position: absolute;width:0px;height:0px;border-right: 20px solid #cd0000;border-bottom: 20px solid #cd0000;right:0px;bottom:0px;border-left:20px solid transparent;border-top:20px solid transparent;">
                      <span class="glyphicon glyphicon-ok"></span>
                    </div>
                  </div>
                  <div class="col-sm-1"></div>
                  <div class="col-sm-4 donate_type" style="border:1px solid #e4e4e4;cursor: pointer;min-height:230px;" status="0" type="2">
                    <div class="col-sm-12" style="text-align: center;padding:10px 0px;font-size:16px;">邮寄至最佳救助点</div>
                    <div class="col-sm-12" style="padding:0px;text-indent:2em;">
                      <p>选择此方式，您需要将捐赠物品邮寄至系统选择的距离待救助儿童最近的救助站，能够更快地救助困境儿童。因此，我们推荐您使用这种方式</p>
                    </div>
                    <div class="click_ok" style="display:none;position: absolute;width:0px;height:0px;border-right: 20px solid #cd0000;border-bottom: 20px solid #cd0000;right:0px;bottom:0px;border-left:20px solid transparent;border-top:20px solid transparent;">
                      <span class="glyphicon glyphicon-ok"></span>
                    </div>
                  </div>
                  <div class="col-sm-1"></div>
                  <div class="col-sm-3 donate_type" style="border:1px solid #e4e4e4;cursor: pointer;min-height:230px;" status="0" type="3">
                    
                    <div class="col-sm-12" style="text-align: center;padding:10px 0px;font-size:16px;">送至附近的救助点</div>
                    <div class="col-sm-12" style="padding:0px;text-indent:2em;">
                      <p>选择此方式，您需要将捐赠物品送至附近的救助物品接收站</p>
                    </div>
                    <div class="click_ok" style="display:none;position: absolute;width:0px;height:0px;border-right: 20px solid #cd0000;border-bottom: 20px solid #cd0000;right:0px;bottom:0px;border-left:20px solid transparent;border-top:20px solid transparent;">
                      <span class="glyphicon glyphicon-ok"></span>
                    </div>
                  </div>
                </div>
                <div class="row col-sm-12" style="margin:40px 0px;">
                  <div class="col-sm-3"></div>
                  <div class="col-sm-2" style="margin:20px 0px;background-color: rgb(28,28,28);cursor: pointer;text-align: center;margin: 5px;padding: 5px;" id="back">上一步</div>
                  <div class="col-sm-2"></div>
                  <div class="col-sm-2" style="margin:20px 0px;background-color: rgb(28,28,28);cursor: pointer;text-align: center;margin: 5px;padding: 5px;" id="donate_type_click">确认选择</div>
                  <div class="col-sm-3"></div>
                </div>
              </div>
            </div>
            <div class="col-sm-1"></div>
          </div>
        </div>
        <div class="col-sm-2"></div>
      </div>
  
      <div class="container">

  <%@ include file="head.jsp" %>
<script src="js/jquery-3.1.0.min.js"></script>
<script>
  $(document).ready(function(){
    $("#gerenzhongxin").click(function(){
      if(false) {
        alert("您还未登录，请先登录再进行查看！");
        location.href="login";
      }
    });
  });
</script>
      <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
          <div class="col-sm-9" style="border-right: 1px dashed #e4e4e4;">
            <div class="row col-sm-12" style="text-align: center;font-size: 24px;margin: 10px 0px;">${project.name}</div>
            <div class="row col-sm-12">
              <div class="col-sm-1"></div>
              <div class="col-sm-10"><img src="${project.img}" width="100%;" ></div>
              <div class="col-sm-1"></div>
            </div>
            <div class="row col-sm-12" style="text-indent: 2em;line-height: 25px;margin-bottom: 20px;">
              ${project.description}
            </div> 
            <div class="row col-sm-12" align="center">
              需求清单表
            </div>
            <div class="row col-sm-12">
              <table class="table table-hover">
                <tr><td>需求物品</td><td>需求数量</td><td>已完成数量 </td><td>备注</td></tr>
                <c:forEach items="${items}" var="item">
                  <tr><td>${item.name}</td><td>${item.amount}</td><td>${item.amount-item.remain_amount}</td><td>${item.remark}</td></tr>
                </c:forEach>
              </table>
            </div>
            <div class="row col-sm-12" style="margin: 20px 0px;">
	            <div class="col-sm-5"></div>
	            <c:choose>
	              <c:when test="${total_remain_amount>0}">
	                <div class="col-sm-2" style="cursor: pointer;padding:10px;background-color:orange;text-align: center;border-radius: 5px;" id="donate1">立即捐赠</div>
	              </c:when>
	              <c:otherwise>
	                <div class="col-sm-2" style="padding:10px;text-align: center;border-radius: 5px;cursor:not-allowed;background-color: gray;">项目已完成</div>
	              </c:otherwise>
	            </c:choose>
		          <div class="col-sm-5"></div>
	          </div>
            <div class="row col-sm-12" style="border-bottom:1px solid #e4e4e4;padding:10px;">
		           评价
		         </div>
		         <c:choose>
		           <c:when test="${evaluates==null}">
		             <div class="row col-sm-12">此项目暂时还没有评价</div>
		           </c:when>
		           <c:otherwise>
		             <div>
		               <c:forEach items="${evaluates}" var="evaluate" varStatus="evaluate_status">
		                 <c:forEach items="${users}" var="user" varStatus="user_status">
                       <c:if test="${evaluate_status.count eq user_status.count}">
		                   <div class="row col-sm-12" style="padding:5px;">
		                     <div class="col-sm-1">
		                        <img src="${user.avatar}" style="border-radius:50%;" width="170%"/>
		                     </div>
		                     <div class="col-sm-10">
		                       <div class="row cl-sm-12">
		                         <div class="col-sm-11">${user.nickname}：${evaluate.evaluation}</div>
		                       </div>
		                       <div class="row col-sm-12">
		                         <div class="col-sm-5">${evaluate.insert_time }</div>
		                         <div class="col-sm-6">
		                           <c:forEach end="${evaluate.point}" begin="1">
		                             <span class="glyphicon glyphicon-star"  style="color:orange;"></span>
		                           </c:forEach>
		                         </div>
		                       </div>
		                     </div>

		                   </div>
		                   </c:if>
                     </c:forEach>
		               </c:forEach>
		             </div>
		           </c:otherwise>
		         </c:choose>

              
              
          </div>
          <div class="col-sm-3">
          <div class="row col-sm-12" style="margin-top:50px;">
            <div class="col-sm-1"></div>
            <div class="col-sm-11" style="font-size: 20px;margin:10px 0px;">
              隶属公益组织
            </div>
          </div>
          <div class="row col-sm-12">
	          <div class="col-sm-1"></div>
            <div class="col-sm-10">
              <a href="OrganazationServlet?method=getorganazation&id=${organazation.id}"><img src="${organazation.avatar }" width="100%"/></a>
            </div>
            <div class="col-sm-1"></div>
          </div>
          <div class="row col-sm-12" >
            <div class="col-sm-1"></div>
           <div class="col-sm-10" style="text-align: center;">
             <a href="OrganazationServlet?method=getorganazation&id=${organazation.id}">${organazation.name}</a>
           </div>
          </div>
            
          </div>
        </div> 
        <div class="col-sm-1"></div>
      </div>

       
      </div>
    <%@ include file="foot.jsp" %>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>
      $(document).ready(function(){
    	  $("#donate").addClass("active");  
    	var donate_type="0";  
      
       $("#donate1").click(function(){
    	   if(${user==null}) {
    		   alert("您需要登录后才可以进行捐赠操作");
    	   }else {
    		   $("#donate_page").css({"display":"block"});
    		   $("body").css({"overflow":"hidden"});
    	   }
       });
       $("#donate_page_remove").click(function() {
           $("#donate_page").css({"display":"none"});
           $("body").css({"overflow":"scroll"});
           $.post(
        		'OrderCar_deleteCar',
        		function(data) {
        			window.location.reload();
        		}
           )
           
       });
       
       
       $(".item_list").click(function(){
    	   var name=$(this).html();
    	   var amount=$(this).attr("amount")-1;
    	   var id=$(this).attr("sign");
    	   $(this).remove();
    	   $("#item_form").append("<tr id='"+id+"'><td>"+name+"</td><td><input type='text' value='1' style='color:black;width:30px;margin:0px 10px;' class='amount'><span class='glyphicon glyphicon-plus add' style='cursor:pointer;'></span><span class='glyphicon glyphicon-minus decrease' style='margin:0px 10px;cursor:pointer;'></span></td><td>"+amount+"</td></tr>");
    	   $.post(
           "OrderCar_addCar",
           {
             id:id,amount:'1'
           },
           function(data) {
             
           }
         )
       });
       $("#item_form").on("click",".add",function(){
	    	   var nowamount=$(this).parent().next().html();
	    	   var amount=$(this).prev().val();
	    	   var id=$(this).parent().parent().attr("id");
	    	   if(nowamount>=1) {
	    		   nowamount--;
	    		   $(this).parent().next().html(""+nowamount);
	    		   amount++;
	    		   $(this).prev().val(""+amount);
	    		   $.post(
               "OrderCar_addCar",
               {
                 id:id,amount:amount
               },
               function(data) {
                 
               }
             )
	    		   
	    	   }
		   });
       $("#item_form").on("click",".decrease",function(){
           var nowamount=$(this).parent().next().html();
           var amount=$(this).prev().prev().val();
           var id=$(this).parent().parent().attr("id");
           if(amount>1) {
        	   nowamount++;
             $(this).parent().next().html(""+nowamount);
             amount--;
             $(this).prev().prev().val(""+amount);
             $.post(
               "OrderCar_addCar",
               {
                 id:id,amount:amount
               },
               function(data) {
                 
               }
             )
           }else {
        	   var name=$(this).parent().prev().html();
        	   $(this).parent().parent().remove();
        	   nowamount++;
        	   $(".item_lists").append("<div class='col-sm-2 item_list' amount="+nowamount+" style='background-color: rgb(28,28,28);cursor: pointer;text-align: center;margin: 5px;padding: 5px;' sign='"+id+"'>"+name+"</div>");
        	   $.post(
 	             "OrderCar_addCar",
 	             {
 	               id:id,amount:'0'
 	             },
 	             function(data) {
 	               
 	             }
 	           );
           }
       });
       
       $(".item_lists").on("click",".item_list",function(){
    	   var name=$(this).html();
           var amount=$(this).attr("amount")-1;
           var id=$(this).attr("sign");
           $(this).remove();
           $("#item_form").append("<tr id='"+id+"'><td>"+name+"</td><td><input type='text' value='1' style='color:black;width:30px;margin:0px 10px;' class='amount'><span class='glyphicon glyphicon-plus add' style='cursor:pointer;'></span><span class='glyphicon glyphicon-minus decrease' style='margin:0px 10px;cursor:pointer;'></span></td><td>"+amount+"</td></tr>");
           $.post(
             "OrderCar_addCar",
             {
               id:id,amount:'1'
             },
             function(data) {
               
             }
           );
       });
       
       $("#back").click(function() {
         $("#step_two").css({"display":"none"});
         $("#step_one").css({"display":"block"});
       });
       
       $("#donate_form_click").click(function(){
    	   if($("#item_form").children().children().length<2) {
            $("#donate_message").css({"display":"block"});
            setTimeout(function(){
                $("#donate_message").css({"display":"none"});
            },1000);
         }else {
        	 $("#step_one").css({"display":"none"});
           $("#step_two").css({"display":"block"});
         }
    	   
    	   
       });
       $(".donate_type").click(function(){
    	   if($(this).attr("status")=="0") {
    		   $(".donate_type").attr("status","0");
    		   $(".donate_type").css({"border":"1px solid #e4e4e4"});
    		   $(".donate_type").children(".click_ok").css({"display":"none"});
    		   $(this).attr("status","1");
    	     $(this).css({"border":"1px solid #CD0000"});
    	     $(this).children(".click_ok").css({"display":"block"});
    	     donate_type=$(this).attr("type");
    	   }
       });
       $("#donate_type_click").click(function(){
    	   location.href="Order_view?type="+donate_type;
       })
       
      });
     
    </script>
    <script src="js/bootstrap.min.js"   ></script>
    <script src="js/view.js"  ></script>
    <script src="js/npm.js"   ></script>  
  </body>

</HTML>