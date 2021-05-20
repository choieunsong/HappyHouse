<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>SSAFY HappyHouse</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${root}/css/bootstrap.css" />
    <link rel="stylesheet" href="${root}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${root}/css/main.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="${root}/css/font.css"/>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src='${root}/js/home.js'></script>

	<c:if test="${not empty msg}">
		<script>
			var message = "${msg}";
			alert(message);
		</script>
	</c:if>
  </head>
<body>


 <!-- 상단 Header Start  -->
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <!-- 상단 Header End  -->

    <!-- 중앙 Contents Start  -->
    <div class="jumbotron text-center" style="margin-bottom:0" id="maintitle">
  		<h1>CHOICHOI HOUSE</h1>
  		<h4>초이초이하우스에서 나만의 집을 초이스해보세요</h4> 
	</div>
	
	<div class="jumbotron text-center mb-4" style="margin-bottom:0; height: 400px; background-image:url(img/house_main.jpg); background-size:100%; background-position: center center">

	</div>
	
    <div class="container text-center pt-5 " style="margin-top:10px; height:360px; display: none;">
     <div>
	 	<span>
	 	  <select class="p-2 mr-1 border border-gray rounded">
		    <option value="id">전체 도/광역시</option>
		  </select>
	 	</span>
	 	<span>
	 	  <select class="p-2 mr-1 border border-gray rounded">
		    <option value="id">전체 시/구/군</option>
		  </select>
	 	</span>
	 	<span>
	 	  <select class="p-2 mr-1 border border-gray rounded">
		    <option value="id">전체 동</option>
		  </select>
	 	</span>
	 	<span>
	 	  <button type="button" class="btn btn-success" onClick="location.href='tradingInformation.html'">검색</button>
	 	</span>
	 </div>
    </div>
    <!-- 중앙 Contents End  -->

    <!-- 하단 Footer Start  -->
   	<%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- 하단 Footer End  -->
    
   <!-- 모달 -->
   	<%@include file="/WEB-INF/views/modal.jsp" %>
  </body>
</html>