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
  <body>
  		<div>탑</div>
  		
        <div>
          <decorator:body />
        </div>

        <footer>
          <div>밭엄</div>
        </footer>
  </body>
</html>


