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
		var replyForm = "<input type='text' id='reply' style='border:1px solid black; width:80%;'>&nbsp;&nbsp;<button class='button1' id='replybtn'>등록</button>";
		
		$(".replyForm").html(replyForm);
		
		$("#delBtn").click(function(){
			var confirm = window.confirm("삭제하시겠습니까?");
			if(confirm == false){
				return false;
			}else{
				swal("삭제되었습니다.");
				location.href='/admin/qnaDel?q_no=${qnaInfo.q_no}'
			} 
		});
		
		$(document).on("click", "#replybtn", function(){
			var reply = $("#reply").val();
			var q_no = $("#q_no").attr("name");
			
			if(reply == ""){
				swal("공백입니다.","댓글을 입력해주세요.", "error");
				return false;
			}
			
			$.ajax({
				url:"/admin/qnaReplyInsert",
				method:"post",
				data:{"reply":reply, "q_no":q_no},
				type:"json",
				success:function(data){
					swal("댓글등록이 완료되었습니다.")
					
					var htmlCode = "관리자 : "+data.q_answer;
					
					
					
					$(".resultReply").html(htmlCode);
					$("#reply").val(" ");
				},
				error:function(){
					alert("실패");
				}
				
			});
			
		}); 
	});

</script> 
<div> 
	<div style="text-align: left; height: 50px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>Q&A Detail</strong></p>
		<br> 
	</div>  
	<hr>
	<input type="hidden" id="q_no" name="${qnaInfo.q_no }">
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
						<td><p class="resultReply"><strong style="color:red;">답변이 없습니다.</strong></p><p class="replyForm"></p></td> 
					</c:when>
					<c:otherwise>
						<td><p class="resultReply">관리자 :&nbsp;${qnaInfo.q_answer }</<br><p class="replyForm"></p></td> 
					</c:otherwise>
				</c:choose>
			</tr>
	</table> 
	<div style="text-align: right;">
		<br>
		<input type="button" value="삭제하기" id="delBtn" class="button1">
		<input type="button" value="뒤로가기" class="button1" onclick="location.href='/admin/qnaList';">
	</div>
</div>
</body>
