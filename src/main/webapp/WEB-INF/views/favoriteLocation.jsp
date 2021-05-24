<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>favoriteLocation</title>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/main.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<link href="${root }/favoritejs/css/app.css" rel="preload" as="style">
<link href="${root }/favoritejs/js/app.js" rel="preload" as="script">
<link href="${root }/favoritejs/js/chunk-vendors.js" rel="preload" as="script">
<link href="${root }/favoritejs/css/app.css" rel="stylesheet">

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	 <div id="app"></div>
    <script src="${root }/favoritejs/js/chunk-vendors.js"></script>
    <script src="${root }/favoritejs/js/app.js"></script>
	
	<!-- 하단 Footer Start  -->
   	<%@include file="/WEB-INF/views/footer.jsp" %>
    
   <!-- 모달 -->
   	<%@include file="/WEB-INF/views/modal.jsp" %>
</body>
</html>