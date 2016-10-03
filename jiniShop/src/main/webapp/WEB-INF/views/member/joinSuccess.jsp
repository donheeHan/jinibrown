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
		<p style="margin-left: 30px; margin-top:130px; font-size:30px;"><strong>JINI BROWN 홈페이지 가입이 완료되었습니다.</strong></p>
		<br>  
		<br>
		<p>홈페이지를 이용하시려면 로그인 해 주세요. 감사합니다.</p>
		<br> 
		<br>
		<input type="button" class="button1" value="로그인하러가기" onclick="location.href='/loginPage'">
	</div>
</body>
