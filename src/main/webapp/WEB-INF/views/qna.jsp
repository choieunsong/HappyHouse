<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
	<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link rel="icon" href="/favicon.ico">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
		
		<link rel="stylesheet" href="${root}/css/bootstrap.css" />
	    <link rel="stylesheet" href="${root}/css/bootstrap.min.css" />
	    <link rel="stylesheet" href="${root}/css/main.css" />
	    <link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@900&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${root}/css/font.css"/>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		
		<title>자유게시판</title>
		 <link href="${root }/vuejs/css/app.css" rel="preload" as="style">
	    <link href="${root }/vuejs/js/app.js" rel="preload" as="script">
	    <link href="${root }/vuejs/js/chunk-vendors.js" rel="preload" as="script">
	    <link href="${root }/vuejs/css/app.css" rel="stylesheet">
	</head>
	<body>
	
	<!-- 상단 Header Start  -->
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div  style="margin-top:100px"></div>
	<div id="app"></div>
	<script src="${root }/vuejs/js/chunk-vendors.js"></script>
	<script src="${root }/vuejs/js/app.js"></script>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>