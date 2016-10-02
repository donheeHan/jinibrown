<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body> 
<script type="text/javascript">
	$(function(){
	 $('.bxslider').bxSlider({ 
	   mode: 'fade',    //사라지는 모냥
	   speen:100,     // 이미지변환 속도 기본 500
	   pager: true,     //하단 페이지
	   auto: true,     //자동시작
	   captions: true,  //캡션
	   controls:false //전 후 콘트롤 보이기 안보이기
	 }); 
	});  
</script>
<div style="width:100%; margin-top: 100px;"> 
<ul class="bxslider">
  <li><img src="/images/main/main1.jpg" title="caption value pic1"/></li>
  <li><img src="/images/main/main2.jpg" title="caption value pic2"/></li>
  <li><img src="/images/main/main3.jpg" title="caption value pic3"/></li>
  <li><img src="/images/main/main4.jpg" title="caption value pic4"/></li>
</ul>
</div>
</body>
</html>