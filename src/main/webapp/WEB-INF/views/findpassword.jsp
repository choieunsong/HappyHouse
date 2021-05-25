<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<c:redirect url="/" />
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>비밀번호 찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${root}/css/bootstrap.css" />
<link rel="stylesheet" href="${root}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/css/font.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src='${root}/js/home.js'></script>
</head>
<body>
	<!-- 상단 Header Start  -->
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- 상단 Header End  -->

	<%-- <div style="margin-top:350px">
		<h3 id=maintitle>비밀번호 찾기 결과</h1>
		<c:if test="${userinfo != null}">
			<h4 style="margin-top:10px">${userinfo.userid}님의 비밀번호는 ${userinfo.password}입니다.</h4>
			<h4 style="margin-top:10px"><a href="${root}/">로그인 하기</a></h4>
		</c:if>
	</div> --%>


	<div class="col-xs-5 col-lg-4 d-flex" style="margin-top: 350px">
		<div class="d-flex col-lg-12">
			<div class="my-auto mx-auto">
				<h2 class="text-center">비밀번호 찾기 결과</h2>

				<div class="form-group" style="margin-top: 50px">
					<c:if test="${userinfo != null}">
						<h5 style="margin-top: 10px">${userinfo.userid}님의비밀번호는
							${userinfo.password}입니다.</h5>
					</c:if>


				</div>
				<input type="hidden" name="_csrf"
					value="a4ffffc9-da3c-46f1-bd3b-a1bca0522f47">
				<button class="btn btn-block btn-primary btn-lg" onclick="location.href='${root}/'">로그인 하기</button>
				<p class="outer0 inner30-top" style="margin-top: 5px">
					로그인 버튼을 누르시면 메인 페이지로 이동합니다.<br>
				</p>
			</div>
		</div>
	</div>
</body>
</html>