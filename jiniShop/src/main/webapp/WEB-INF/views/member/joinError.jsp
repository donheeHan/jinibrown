<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<body>
	<div class="divCenter" style="border:1px solid red; height: 400px;"> 
		<p style="margin-left: 30px; margin-top:130px; font-size:30px;"><strong>JINI BROWN 홈페이지 가입이 실패하였습니다.</strong></p>
		<br>  
		<br>
		<p>죄송합니다. 서버오류로 인해 가입이 실패하였습니다. 다시 가입해주세요.</p>
		<br> 
		<br>
		<input type="button" class="button1" value="메인으로" onclick="location.href='/main'">
	</div>
</body>
