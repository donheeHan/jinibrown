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
  <title>Hongja Shop</title>
<link href="css/shopping.css" rel="stylesheet">
</head>
<script type = "text/javascript" src="./js/jquery-1.12.4.js"></script>
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
       <p style="color:orange">
         ${sessionScope.loginUser.name}(${sessionScope.loginUser.id})
       </p>
       <p><a href="/logout.do"><img src="./images/Logout.jpg"></a></p>
       </c:otherwise>       
       </c:choose>
       
       <p class="aa">♥</p>
       <p>
         <a href="/cartList.do"><img src="./images/cart.jpg"></a>
       </p>
       <p class="aa">♥</p>
       <p>
         <a href="/myPageHome.do"><img src="./images/mypage.jpg"></a>
       </p>
       </c:when>
       </c:choose>
       <p class="aa">♥</p>
       <p> 
         <a href="/noticeList.do"><img src="./images/notice.jpg"></a>
       </p>
        <p class="aa">♥</p>
       <p>
         <a href="/qnaList.do"><img src="./images/qna.jpg"></a>
       </p>
       <p class="aa">♥</p>
       <p>
         <a href="/review.do"><img src="./images/review.jpg"></a>
       </p>
         <c:if test="${empty sessionScope.loginUser}">
       <p> 
       <p class="aa">♥</p>
       <p>
	     <a href="/admin.do" ><img src="./images/admin.jpg"></a>
 		</p>
 		</c:if>
 </div>
<div id="wrap">
<!--헤더파일 들어가는 곳 시작 -->
  <header>  
    <!--로고 들어가는 곳 시작--->  
    <div class="divCenter">
      <a href="/main"><img src="/images/mainlogo.png" style="width:100%;"></a>
    </div>
    <!--로고 들어가는 곳 끝-->     
    <nav id="top_menu">
      <ul style="list-style: none;">
        <li>
          <a href="/selectProduct.do?kind=1"><img src="./images/rash.jpg"></a>
        </li>  
        <li>
          <a href="/selectProduct.do?kind=2"><img src="./images/biki.jpg"></a>
        </li>  
        <li>
          <a href="/selectProduct.do?kind=3"><img src="./images/ACC.jpg"></a>
        </li> 
        <li>
          <a href="/selectProduct.do?kind=4"><img src="./images/jewerly.jpg"></a>
        </li> 
      </ul>
    </nav>

    <div class="clear"></div>
    <hr>
  </header>
 </div>
  <!--헤더파일 들어가는 곳 끝 -->