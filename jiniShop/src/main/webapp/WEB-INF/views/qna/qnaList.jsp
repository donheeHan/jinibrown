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
			location.href='/qnaDetail?q_no='+q_no+'';
		})
	});

</script>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>Q&A</strong></p>
		<br> 
	</div>  
	<div style="text-align: right; height: 50px;">  
		<input type="button" class="button1" onclick="location.href='/qnaWriteForm';" value="문의하기">
	</div>
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th>NO</th>
				<th>TYPE</th>
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
			           		<td>
			           			<c:if test="${empty qnaList.p_no}">
			           				일반문의
			           			</c:if>
			           			<c:if test="${!empty qnaList.p_no}">
			           				<c:if test="${qnaList.p_cate == '1' }">
			           					Cheek
			           				</c:if>
			           				<c:if test="${qnaList.p_cate == '2' }">
			           					Eye
			           				</c:if>
			           				<c:if test="${qnaList.p_cate == '3' }">
			           					Face
			           				</c:if>
			           				<c:if test="${qnaList.p_cate == '4' }">
			           					Lip
			           				</c:if>
			           				<c:if test="${qnaList.p_cate == '5' }">
			           					Skincare
			           				</c:if>
			           				<c:if test="${qnaList.p_cate == '6' }">
			           					More
			           				</c:if>
			           				&nbsp;>&nbsp;${qnaList.p_name }
			           			</c:if>
			           		</td>
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
