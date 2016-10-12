<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<body>
<script>
	$(function(){
		$("#datatable").DataTable();
	});

</script>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>거래처관리</strong></p>
		<br> 
	</div>  
	<form action="/admin/clientInsert" method="post">
	<div style="text-align: right; height: 50px;">
		거래처 이름:<input type="text" name="c_name" required="required">
		거래처 번호:<input type="text" name="c_tel" required="required">
		<input type="submit" class="button1" value="거래처등록">
	</div>
	</form>
	<div style="height: 100px;"></div>
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th>NO</th>
				<th>NAME</th>
				<th>TEL</th>
				<th>DEL</th>
			</tr>
		</thead>
	    <tbody>
	        	<c:choose>
	        		<c:when test="${empty clientList }">
			        <tr>
	        			<td colspan="3">거래처가 없습니다.</td>
			        </tr>
	        		</c:when>
	        		<c:otherwise>
			           	<c:forEach var="client" items="${clientList}">
				        <tr id="${client.c_no }" class="listTr">
				        	<td>${client.c_no }</td>
			           		<td>${client.c_name }</td>
			           		<td>${client.c_tel }</td>
			           		<td><a href="/admin/clientDel?c_no=${client.c_no }">X</a></td>
				        </tr>
			           	</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	    </tbody>
	</table> 


</div>
</body>
