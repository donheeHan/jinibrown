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
		var d = new Date();
		
		var year = d.getFullYear();
		var month = d.getMonth();
		var day = d.getDate();
		
		var date = year+"-"+(month+1)+"-"+day;
		
		$("#q_day").val(date);
		
		//항목 변경시
		$("#selone").change(function(){
			var htmlCode = "<select id='seltwo' class='selec'>";
			htmlCode += "<option value='1'>Cheek</option>";
			htmlCode += "<option value='2'>Eye</option>";
			htmlCode += "<option value='3'>Face</option>";
			htmlCode += "<option value='4'>Lip</option>";
			htmlCode += "<option value='5'>Skin care</option>";
			htmlCode += "<option value='6'>More</option>";
			htmlCode += "</select>";
			
			if($("#selone").val() == "2"){
				$("#selre").append("&nbsp;&nbsp;>&nbsp;&nbsp;"+htmlCode);
				var cate = $("#seltwo").val();
				$.ajax({
					url : "/productCate",
					method : "get",
					data : {"cate" : cate},
					type : "json",
					success : function(data) {
						var productCode = "";
						productCode += "<select id='selthree' class='selec'>";
						$.each(data, function(index, value){
							productCode += "<option value="+value.p_no+">"+value.p_name+"</option>";
						});
						productCode += "</select>";
						$("#selree").html("&nbsp;&nbsp;>&nbsp;&nbsp;"+productCode);
						$("#q_p_no").val($("#selthree").val());
						$(document).on("change", "#selthree", function(){
							var q_p_no = $("#selthree").val();
							
							$("#q_p_no").val(q_p_no);
						});
					}
				});
				
				$(document).on("change", "#seltwo", function(){
					cate = $("#seltwo").val();
					$.ajax({
						url : "/productCate",
						method : "get",
						data : {"cate" : cate},
						type : "json",
						success : function(data) {
							var productCode = "";
							productCode += "<select id='selthree' class='selec'>";
							$.each(data, function(index, value){
								productCode += "<option value="+value.p_no+">"+value.p_name+"</option>";
							});
							productCode += "</select>";
							$("#selree").html("&nbsp;&nbsp;>&nbsp;&nbsp;"+productCode);
							$("#q_p_no").val($("#selthree").val());
							$(document).on("change", "#selthree", function(){
								var q_p_no = $("#selthree").val();
								
								$("#q_p_no").val(q_p_no);
							});
						}
					});
				});
			}else{
				$("#selre").html("");
				$("#selree").html("");
			}
		});
	});

</script>
<style type="text/css">
	.selec{width:150px; height: 30px;}
</style>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>Q&A Write</strong></p>
		<br> 
	</div>  
	<form action="/qnaWrite" method="post">
	<table class="simple_table" id="writeTable">
			<tr>
				<th>제목</th>
				<td><input type="text" placeholder="제목을 입력해주세요." required="required" name="q_title"></td>
			</tr>
			<tr>
				<th>문의종류</th>
				<td>
						<span>
						<select id="selone" class="selec">
							<option value="1">일반문의</option>
							<option value="2">상품문의</option>
						</select>
						</span>
						<span id="selre"></span>
						<span id="selree"></span>
						<input type="hidden" id="q_p_no" name="q_p_no">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="q_user" name="q_user" readonly="readonly" value="${loginUser.id }"></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><input type="text" id="q_day" name="q_day" readonly="readonly"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="100" rows="20" name="q_content"></textarea></td> 
			</tr>
	</table> 
	<div style="text-align: right;">
		<br>
		<input type="submit" value="등록하기" class="button1">&nbsp;&nbsp;
		<input type="button" value="뒤로가기" class="button1" onclick="history.back();">
	</div>
	</form>
</div>
</body>
