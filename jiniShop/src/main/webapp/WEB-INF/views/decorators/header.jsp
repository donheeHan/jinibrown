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
            }); 
        </script>
         <style>
            #fixedDiv{
                position:absolute;
                width:40px;
                top:150px;
                right:70px;
                padding:0;
                margin:0;
                z-index:1000;
            }
            .aa{
            	color:red;
            	margin-left: 50%;
            }
        </style>

<body>
<div id="fixedDiv">
	<c:choose>
	<c:when test="${empty sessionScope.admin}">
       <c:choose>
       <c:when test="${empty sessionScope.loginUser}">
       <p>         
         <a href="/loginPage" style="width:110px;"><img src="./images/login.jpg"></a>   
	   </p>		       
      <p class="aa">♥</p>
       <p><a href="/joinForm"><img src="./images/join.jpg"></a></p>
       </c:when>
       <c:otherwise>
       <span style="color:orange">${sessionScope.loginUser.name}<br>(${sessionScope.loginUser.id})</span>
       <p><a href="/logout"><img src="./images/Logout.jpg"></a></p>
       </c:otherwise>       
       </c:choose>
       
       <p class="aa">♥</p>
       <p>
         <a href="#"><img src="./images/cart.jpg"></a>
       </p>
       <p class="aa">♥</p>
       <p>
         <a href="#"><img src="./images/mypage.jpg"></a>
       </p>
       </c:when>
       </c:choose>
        <p class="aa">♥</p>
       <p>
         <a href="/qnaList"><img src="./images/qna.jpg"></a>
       </p>
         <c:if test="${empty sessionScope.loginUser}">
       <p> 
       <p class="aa">♥</p>
       <p>
	     <a href="#" ><img src="./images/admin.jpg"></a>
 		</p>
 		</c:if>
 </div>
<div>
<!--헤더파일 들어가는 곳 시작 -->
  <header>  
    <!--로고 들어가는 곳 시작--->  
    <div class="divCenter">
      <a href="/main"><img src="/images/mainlogo.png" style="width:60%;"></a>
    </div>
    <!--로고 들어가는 곳 끝-->     
    <nav id="top_menu">
      <ul style="list-style: none;">
        <li>메뉴들어가야할고오오오오오옷</li>
      </ul>
    </nav>

    <div class="clear"></div>
    <hr>
  </header>
 </div>
  <!--헤더파일 들어가는 곳 끝 -->