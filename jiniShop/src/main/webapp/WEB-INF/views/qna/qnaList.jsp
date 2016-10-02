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
		<p style="margin-left: 30px; margin-top:100px; font-size:30px;"><strong>Q&A</strong></p>
		<br> 
	</div>  
	<div style="text-align: right; height: 50px;">  
		<input type="button" class="btn" value="문의하기">
	</div>
	<table class="simple_table" id="datatable">
		<thead>
			<tr>
				<th>NO</th>
				<th>SUBJECT</th>
				<th>WRITER</th>
				<th>DATE</th>
				<th>HIT</th>
			</tr>
		</thead>
	    <tbody>
	        <tr>
	            <td scope="row">항목명</td>
	            <td>내용이 들어갑니다.</td>
	            <td>내용이 들어갑니다.</td>
	            <td>내용이 들어갑니다.</td>
	            <td>내용이 들어갑니다.</td>
	        </tr>
	    </tbody>
	</table> 

</div>
</body>
