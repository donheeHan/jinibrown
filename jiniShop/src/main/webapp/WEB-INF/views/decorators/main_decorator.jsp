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
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <title>JiMi Shop! </title>
  </head>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.form.js"></script>
	<script src="/js/sweetalert.min.js"></script>
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
          <div class="divCenter">Copyright ©All rights reserved. Designed By madeleine</div>
        </footer>
  </body>
</html>


