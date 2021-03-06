<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<style type="text/css">
/* 테이블스타일 */
.simple_table {
    width: 100%;
    border: none;
    border-collapse: separate;
    border-spacing: 2px;
}
 
.simple_table th { 
    padding: 15px;
    border-bottom: 1px solid #DDD;
    background: #F8ECE0;  
    font-weight: normal;
    text-align:center;
    text-shadow: 0 1px #FFF;
    vertical-align: middle;
}
 
.simple_table td {
    padding: 15px;
    border: none;
    border-bottom: 1px solid #DDD;
    text-align: left;
    vertical-align: baseline;
}
.simple_table tr:hover{
	background-color: lightyellow; 
}

.simple_table input:text{
	width: 300px; 
}

.simple_table input:checkbox{
 	width: 15px;
 	height: 15px;
}

/* qna등록 테이블 */
#writeTable{
	font-size:17px;
}

#writeTable th{
	font-weight: normal;
    text-align:center;
    text-shadow: 0 1px #FFF;
	width: 20%;
} 
 
#writeTable td{
	width: 80%;
	vertical-align: baseline;
}

#writeTable input{
	border:none;
	width: 100%;
	height: 30px;
}

/* 버튼스타일 */
.button1 {
	border:none;    /*---테두리 정의---*/
	background-Color:#F8ECE0;   /*--백그라운드 정의---*/
	font:12px 굴림;      /*--폰트 정의---*/
	font-weight:bold;   /*--폰트 굵기---*/
	color:black;    /*--폰트 색깔---*/
	width:130px;height:30px;  /*--버튼 크기---*/ 
} 
.button1:hover{ 
	color:red;
} 

.button2 {
 border:1x solid #333333; /* 테두리 정의 */
 /* border: 1px dashed #ff008; /* 테두리 점선 */
 background-Color:#E4E4E4; /* 백그라운드 정의 */
 font:12px 굴림; /* 폰트 정의 */
 font-weight:bold; /* 폰트 굵기 */
 color:#444444; /* 폰트 색깔 */
 width:130;height:30; /* 버튼 크기 */
}
</style>
 
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <title>JiMi Shop! </title>
  </head>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.form.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sweetalert.min.js"></script>
	<script src="/js/jquery.dataTables.min.js"></script>
	<script src="/js/dataTables.bootstrap.min.js"></script>
	<script src="/js/jquery.bxslider.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
	
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
	<link href="/css/login.css" rel="stylesheet" />
	<link href="/css/jquery.bxslider.css" rel="stylesheet" />
	<link href="/css/font-awesome.min.css" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/css/dataTables.bootstrap.min.css" rel="stylesheet">
	<link href="/css/sweetalert.css" rel="stylesheet">
	<link href="/css/common.css" rel="stylesheet">
  <body>
  		<br><br><br>
  		<jsp:include page="admin_header.jsp"></jsp:include>
  		
        <div class="divCenter" style="width: 100%; min-height: 600px; max-height: auto;">
	        <div class="divCenter" style="width: 60%; display:inline-block;">
          <decorator:body />
          	</div>
        </div> 


		<hr>
        <footer>
          <div class="divCenter"><img src="/images/main/botmain.jpg"></div>
        </footer>
  </body>
</html>


