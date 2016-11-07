<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div style="text-align: left;">
		<c:choose>
			<c:when test="${empty productList }">
				<div style="text-align: center;">
					<br> <br>
					<h1>상품준비중</h1>
					<br> <br>
					<p style="font-size: 25px;">빠른 시일내에 상품을 준비하겠습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${productList}" var="item" varStatus="status">
					<li style="list-style:none; float:left; margin-right:10px; max-width: 270px;"> 
						<div style="display: inline-block;">   
							<a href="/productDetail?productNo=${item.p_no}"> <img  
								src="/images/productImage/${item.p_mainimg }"
								style="width: 270px; height: 250px;" /></a>
						</div>
						<div> 
							<br />
							<p style="text-align: center; font-size:13px; overflow: hidden; text-overflow: ellipsis;"><strong>${item.p_name}</strong></p>
							<p style="text-align: center; font-size:13px; color:#FF4000; overflow: hidden; text-overflow: ellipsis;">${item.p_info}</p> 
							<p style="text-align: center; font-size:15px; overflow: hidden; text-overflow: ellipsis;">
							<c:if test="${item.p_qty != 0 }">
								<strong>${item.p_price}</strong>
							</c:if>
							<c:if test="${item.p_qty == 0 }">
								<strong style="color:red;">sold out</strong>
							</c:if>
							</p>
							<p style="text-align: center; font-size:13px; overflow: hidden; text-overflow: ellipsis;"><strong>조회수 : ${item.p_count}</strong></p>
						</div>
					</li>
					<c:if test="${status.count%4==0}">
						<div style="clear:both; height: 30px;"></div>
					</c:if>
				</c:forEach>
			</c:otherwise>  
		</c:choose>
	</div>
</body>
</html>