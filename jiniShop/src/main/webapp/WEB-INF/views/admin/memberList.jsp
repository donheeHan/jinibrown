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
			var id = $(this).attr("id");
			location.href='/admin/adminMemberDetail?id='+id+'';
		})
	});

</script>
<div>
	<div style="text-align: left; height: 80px;">
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>회원관리</strong></p>
		<br> 
	</div>  
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th>NO</th>
				<th>ID</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>BIRTHDAY</th>
				<th>POINT</th>
			</tr>
		</thead>
	    <tbody>
	        	<c:forEach var="memberList" items="${memberList }" varStatus="status">
	        		<tr id="${memberList.id }" class="listTr">
	        			<td>${status.count }</td>	
	        			<td>${memberList.id }</td>	
	        			<td>${memberList.name}</td>	
	        			<td>${memberList.email}</td>	
	        			<td>${memberList.birthday}</td>	
	        			<td>${memberList.point}</td>	
	        		</tr>
	        	</c:forEach>
	    </tbody>
	</table> 

</div>
</body>
