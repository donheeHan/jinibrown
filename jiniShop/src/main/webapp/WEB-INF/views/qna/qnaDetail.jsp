<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<body>
<script type="text/javascript">
	$(function(){
		
		$("#delBtn").click(function(){
			var confirm = window.confirm("삭제하시겠습니까?");
			if(confirm == false){
				return false;
			}else{
				swal("삭제되었습니다.");
				location.href='/qnaDel?q_no=${qnaInfo.q_no}'
			} 
		});
		
	});

</script> 
<div> 
	<div style="text-align: left; height: 50px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>Q&A Detail</strong></p>
		<br> 
	</div>  
	<hr>
	<table class="simple_table" id="writeTable">
			<tr>
				<th>제목</th>
				<td>${qnaInfo.q_title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${qnaInfo.q_user }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${qnaInfo.q_day }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="100" rows="20" readonly="readonly" style="border:0;">${qnaInfo.q_content }</textarea></td> 
			</tr>
			<tr>
				<th>답변</th>
				<c:choose>
					<c:when test="${empty qnaInfo.q_answer }">
						<td style="color:red;"><strong>답변이 없습니다.</strong></td> 
					</c:when>
					<c:otherwise>
						<td>관리자 :&nbsp;${qnaInfo.q_answer }</td> 
					</c:otherwise>
				</c:choose>
			</tr>
	</table> 
	<div style="text-align: right;">
		<br>
		<input type="button" value="삭제하기" id="delBtn" class="button1">
		<input type="button" value="뒤로가기" class="button1" onclick="history.back();">
	</div>
</div>
</body>
