<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8" />
<title>CHOICHOI HOUSE MyPage</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${root}/css/bootstrap.css" />
<link rel="stylesheet" href="${root}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/css/font.css"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script>
$(document).ready(function() {
	// 회원정보 수정
	$("#modifyMypage").click(function() {
		if ($("#newUserID").val() == "") {
			alert("아이디를 입력하세요");
			return;
		} else if ($("#newPassword").val() == "") {
			alert("비밀번호를 입력하세요");
			return;
		} else if ($("#newName").val() == "") {
			alert("이름을 입력하세요");
			return;
		} else if ($("#newEmail").val() == "") {
			alert("이메일을 입력하세요");
			return;
		} else if ($("#address").val() == "") {
			alert("주소를 입력하세요");
			return;
		} else {
			alert("회원 정보가 변경되었습니다.");
			let registerinfo = JSON.stringify({
				"username" : $("#newName").val(), 
				"userid" : $("#newUserID").val(), 
				"password" : $("#newPassword").val(), 
				"email" : $("#newEmail").val(), 
				"address" : $("#address").val()
			   });
			$.ajax({
				url:'${root}/user/modifyMypage',  
				type:'POST',
				contentType:'application/json;charset=utf-8', // 보낼 데이터가 json이라고 알려주어야 함
				dataType:'json', // 다시 json으로 받겠다고 알려주어야 함
				data: registerinfo,
				success:function(users) {
					$("#username").val('');
					$("#newUserID").val('');
					$("#newPassword").val('');
					$("#newEmail").val('');
					$("#address").val('');
					//makeList(users);
					document.location.href='/happyhouse';
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		}
	});
});
</script>
</head>
<body>
	<!-- 상단 Header Start  -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- 중앙 Contents Start  -->
	<div class="container pt-5" style="margin-top: 80px;">
		<h3 class="font-weight-bold text-center">마이 페이지</h3>
		<div class="float-left" style="font-size: 16pt">정보 수정</div>
		<br>
		<br>
		<div>
			<form id="mypageForm" method="post" action="">
				<input type="hidden" name="action" id="action" value="modifyMypage">
				<div class="form-group">
					<label for="ID">아이디</label> <input type="text" class="form-control"
						value="${userinfo.userid}" id="newUserID"
						onkeyup="noSpaceForm(this); textLength(this, 20);"
						onchange="noSpaceForm(this); textLength(this, 20);" readonly>
				</div>
				<div class="form-group">
					<label for="password">비밀번호 (20자 이내)</label> <input type="password"
						class="form-control" placeholder="비밀번호를 입력하세요" id="newPassword"
						onkeyup="noSpaceForm(this); textLength(this, 20);"
						onchange="noSpaceForm(this); textLength(this, 20);"
						>
				</div>
				<!-- 
		    <div class="form-group">
		      <label for="password2">User Password Confirm (* 20자 이내)</label>
		      <input type="password" class="form-control" placeholder="Password" id="password2"
		      			 onkeyup="noSpaceForm(this); textLength(this, 20);" onchange="noSpaceForm(this); textLength(this, 20);">
		    </div> -->
				<div class="form-group">
					<label for="name">이름 (10자 이내)</label> <input type="text"
						class="form-control" value="${userinfo.username}" id="newName"
						onkeyup="noSpaceForm(this); textLength(this, 10);"
						onchange="noSpaceForm(this); textLength(this, 10);">
				</div>
				<div class="form-group">
					<label for="name">이메일(20자 이내)</label> <input type="text"
						class="form-control" value="${userinfo.email}" id="newEmail"
						name="email" onkeyup="noSpaceForm(this); textLength(this, 20);"
						onchange="noSpaceForm(this); textLength(this, 10);">
				</div>
				<div class="form-group">
					<label for="address">주소</label> <input type="text"
						class="form-control" value="${userinfo.address}" id="address" name="address"
						onclick="execDaumPostcode(this)" readonly>
				</div>
				<div class="form-group">
					<label for="address2">상세 주소 (50자 이내)</label> <input type="text"
						class="form-control" value="${userinfo.address}" id="address2"
						onkeyup="noSpaceForm(this); textLength(this, 50);"
						onchange="noSpaceForm(this); textLength(this, 50);">
				</div>
			</form>
		</div>
		<button type="button" id="modifyMypage" class="btn btn-primary">회원정보 수정</button>
		<button type="button" id="cancelBtn" class="btn btn-primary"
			onclick="location.href='${root}'">취소</button>
	</div>
	<!-- 중앙 Contents End  -->

	<!-- 하단 Footer Start  -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- 하단 Footer End  -->

	<!-- 모달 -->
	<%@include file="/WEB-INF/views/modal.jsp"%>
</body>
</html>