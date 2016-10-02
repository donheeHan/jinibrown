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

/* 버튼스타일 */
.btn {
	border:1px solid black;    /*---테두리 정의---*/
	background-Color:#F8ECE0;   /*--백그라운드 정의---*/
	font:12px 굴림;      /*--폰트 정의---*/
	font-weight:bold;   /*--폰트 굵기---*/
	color:#ff0080;    /*--폰트 색깔---*/
	width:130;height:30;  /*--버튼 크기---*/ 
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
	 
	
	
	<link href="/css/jquery.bxslider.css" rel="stylesheet" />
	<link href="/css/font-awesome.min.css" rel="stylesheet" />
	<link href="/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/css/dataTables.bootstrap.min.css" rel="stylesheet">
	<link href="/css/sweetalert.css" rel="stylesheet">
	<link href="/css/common.css" rel="stylesheet">
  <body>
  		<br><br><br>
  		<jsp:include page="header.jsp"></jsp:include>
  		
        <div class="divCenter" style="width: 100%; min-height: 1000px; max-height: auto;">
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


