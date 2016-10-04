<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
			<c:forEach items="${productList3}" var="item" varStatus="status">
			<div style="display: inline-block;">
					<a href="/productDetail?productNo=${item.p_no}">
					<img src="/resources/testImage/${item.p_mainimg }" style="width:250px; height:250px;"><br>
					${item.p_mainimg}<br>
					${item.p_name}<br>
					<span>${item.p_price} 원</span><br>
					${item.p_info}<br>
					</a>
			</div>
				<c:if test="${status.count%4==0}">
					<br><hr style="width:500px;">
				</c:if>
			</c:forEach>
	</div>
</body>
</html>