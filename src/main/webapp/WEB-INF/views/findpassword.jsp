<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/"/>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>비밀번호 찾기</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">  
</head>
<body>
<c:if test="${userinfo != null}">
${userinfo.userid}님의 비밀번호는 ${userinfo.password}입니다.
<a href="${root}/">로그인 하기</a>
</c:if>

</body>
</html>