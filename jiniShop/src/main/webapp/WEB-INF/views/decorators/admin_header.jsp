<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "No-cache");
	response.setHeader("Cache-Control", "No-store");
	response.setDateHeader("Expires", 1L);
%>

<head>
  <meta charset="utf-8">
  <title>JiNi Shop</title>
</head>
    <script type="text/javascript">
            $(document).ready(function(){
                var topHeight = parseInt($("#fixedDiv").css("top").substring(0,$("#fixedDiv").css("top").indexOf("px")))
                $(window).scroll(function () { 
                    offset = topHeight+$(document).scrollTop()+"px";
                    $("#fixedDiv").animate({top:offset},{duration:500,queue:false});
                });
                
                var loginCheck = $("#loginCheck").attr("name");
                $("#qna").click(function(){
                	if(loginCheck != ""){
                		
                	}else{
                		swal("로그인 후 이용가능합니다.");
                		return false;
                	}
                });
                $("#cart").click(function(){
                	if(loginCheck != ""){
                		
                	}else{
                		swal("로그인 후 이용가능합니다.");
                		return false;
                	}
                });
            }); 
        </script>
         <style>
            #fixedDiv{
                position:absolute;
                width:40px;
                top:300px;
                right:70px;
                padding:0;
                margin:0;
                z-index:1000;
            }
            .aa{
            	color:red;
            	margin-left: 50%;
            }
            #menuDiv li:hover{
            	border-bottom: 3px solid #DA81F5;
            }
        </style> 

<body style="line-height:1;"> 
<div id="fixedDiv">
	<input type="hidden" id="loginCheck" name="${loginUser.id }">
       <p><a href="/logout"><img src="/images/Logout.jpg"></a></p>

 </div>
<div>
<!--헤더파일 들어가는 곳 시작 -->
  <header>  
  	<div style="margin-bottom: 10px; margin-right:30px; text-align: right;">
  		
		<c:choose>
			<c:when test="${empty sessionScope.admin}">
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
				  		 안녕하세요.<strong style="color:#DA81F5;">JINI BROWN</strong> 입니다. 즐거운 시간 되세요.
					</c:when> 
					<c:otherwise> 
						환영합니다. <strong style="color:#DA81F5;">${loginUser.name }(${loginUser.id })</strong>님 즐거운 시간 되세요.
					</c:otherwise>       
				</c:choose>
			</c:when>
		</c:choose>
  	
  	
  	</div> 
    <!--로고 들어가는 곳 시작--->  
    <div class="divCenter" style="background:url('../../resources/images/main/mainBack.png'); background-size:100%;">
      <a href="/admin/memberList"><img src="/images/mainlogo.png" style="width:60%;"></a>
    </div>
    <!--로고 들어가는 곳 끝-->
    <!-- 메뉴들어가는 곳 시작 -->     
    <div class="divCenter" id="menuDiv" style="width:100%; height: 60px;">
    	<div style="width: 60%; height: 60px; margin: auto; margin-top: 40px;">
		    <nav>  
		      <ul style="list-style: none;"> 
		        <li style="float: left;"><a href="/admin/memberList"><img src="/images/menu/admin1.png"></a>&nbsp;</li>
		        <li style="float: left;"><a href="/admin/productList"><img src="/images/menu/admin2.png"></a>&nbsp;</li>
		        <li style="float: left;"><a href="/admin/clientList"><img src="/images/menu/admin3.png"></a>&nbsp;</li>
		        <li style="float: left;"><a href="/admin/sellList"><img src="/images/menu/admin5.jpg"></a></li>
		        <li style="float: left;"><a href="/admin/qnaList"><img src="/images/menu/admin4.png"></a></li>
		      </ul>
		    </nav>
	    </div>
    </div>
    <!-- 메뉴들어가는 곳 끝 -->     

    <div style="clear:both;"></div>
    <hr>
  </header>
 </div>
  <!--헤더파일 들어가는 곳 끝 -->