<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<meta charset="UTF-8" />
    <title>CHOICHOI HOUSE MyPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/main.css" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script>
$(document).ready(function() {
	// 로그인
	$("#confirmPassword").click(function() {
		console.log('confirmPassword창에서 확인 버튼 누름')
		if($("#password").val() == "") {
			alert("비밀번호를 입력하세요");
			return;
		} else {
			$("#confirmPasswordForm").attr("action", "${root}/user/myPage").submit();
		}
	});
});
</script>
<body>
	<!-- 상단 Header Start  -->
    <%@ include file="/WEB-INF/views/header.jsp" %>
    
     <!-- 중앙 Contents Start  -->
    <div class="container pt-5" style="margin-top:100px">
     <h3 class="font-weight-bold text-center">비밀번호를 입력하세요</h3>

	 <br><br>
	<div>
		<form id="confirmPasswordForm" method="post" action="">
		<input type="hidden" name="action" id="action" value="confirmPassword">
		    <div class="form-group">
		      <label for="ID">아이디</label>
		      <!-- <input type="userid" class="form-control" placeholder="아이디를 입력하세요" id="userid" name="userid"> -->
		     <input type="text" class="form-control" placeholder="${userinfo.userid}" value="${userinfo.userid}" id="userid" name="userid" onchange="noSpaceForm(this); textLength(this, 20);" readonly>
		    </div>
		    <div class="form-group">
		      <label for="password">비밀번호</label>
		      <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="password" name="password">
		    </div>
	   	</form>
   	</div>
	    <button type="button" id="confirmPassword" class="btn btn-primary">확인</button>
   </div>
   <!-- 중앙 Contents End  -->
    
    <!-- 하단 Footer Start  -->
   	<%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- 하단 Footer End  -->
    
   <!-- 모달 -->
   	<%@include file="/WEB-INF/views/modal.jsp" %>
</body>
</html>