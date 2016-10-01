<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script src="http://malsup.github.com/jquery.cycle2.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<style type="text/css">

.cycle-slideshow, .cycle-slideshow *

{

	-webkit-box-sizing: border-box;

	-moz-box-sizing: border-box;

	box-sizing: border-box;

}

.cycle-slideshow

{

	width:1000;

	margin : 0px auto;

	padding: 0;

	position : relative;

}

.cycle-slideshow div.slide

{

	width: 100%;

	height : 100%;

}

.cycle-slideshow img

{

	position : absolute;

	top : 0;

	left : 0;

	width : 100%;

	padding : 0;

	display : block;

}

.cycle-slideshow imgLfirst-child

{

	position : static;

	z-index : 100;

}

.cycle-pager

{

	text-align : center;

	width : 100%;

	z-index : 500;

	position : absolute;

	top : 10px;

	

}

.cycle-pager span

{

	font-family : serif;

	font-size : 50px;

	width: 16px;

	height: 16px;

	display : inline-block;

	color : #DDD;

	cursor : pointer;

}

.cycle-pager span.cycle-pager-active

{

	color : #D69746;

}

.cycle-pager > *

{

	cursor: pointer;

}


</style>

</head>

<body>

<div class="cycle-slideshow" cycle-slideshow data-cycle-loader="wait" style="width:1000px; height:auto;"> 

	<div class="cycle-slideshow" data-cycle-fx=scrollHorz data-cycle-timeout=2000>




	<div class="cycle-pager"></div>     

      <img src="/images/main/main1.jpg" width="1000" height="auto" alt="Slide 1" />
      <img src="/images/main/main2.jpg" width="1000" height="auto" alt="Slide 2" />
      <img src="/images/main/main3.jpg" width="1000" height="auto" alt="Slide 3" />
      <img src="/images/main/main4.jpg" width="1000" height="auto" alt="Slide 3" />
      <img src="/images/main/main5.jpg" width="1000" height="auto" alt="Slide 3" />


      </div>

    </div>


</body>

</html>