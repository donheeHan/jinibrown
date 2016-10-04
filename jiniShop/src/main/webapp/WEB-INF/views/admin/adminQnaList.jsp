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
		
		$(".listTr").click(function(){
			var q_no = $(this).attr("id");
			location.href='/admin/adminQnaDetail?q_no='+q_no+'';
		})
	});

</script>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>Q&A</strong></p>
		<br> 
	</div>  
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th>NO</th>
				<th>SUBJECT</th>
				<th>WRITER</th>
				<th>DATE</th>
				<th>RE</th>
			</tr>
		</thead>
	    <tbody>
	        	<c:choose>
	        		<c:when test="${empty qnaList }">
			        <tr>
	        			<td colspan="5">문의하신 내용이 없습니다.</td>
			        </tr>
	        		</c:when>
	        		<c:otherwise>
			           	<c:forEach var="qnaList" items="${qnaList}">
				        <tr id="${qnaList.q_no }" class="listTr">
			           		<td>${qnaList.q_no }</td>
			           		<td>${qnaList.q_title }</td>
			           		<td>${qnaList.q_user }</td>
			           		<td>${qnaList.q_day }</td>
			           		<c:if test="${empty qnaList.q_answer }">
			           			<td style="color:red;">대기</td>
			           		</c:if>
			           		<c:if test="${!empty qnaList.q_answer }">
			           			<td style="color:blue;">답변완료</td>
			           		</c:if>
				        </tr>
			           	</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	    </tbody>
	</table> 

</div>
</body>