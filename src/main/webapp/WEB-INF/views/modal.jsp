<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <link rel="stylesheet" type="text/css" href="${root}/css/dropdown.css"/>
     
    <script>
    $(document).ready(function() {
    	// 로그인
    	$("#btnLogin").click(function() {
    		
    		if($("#inputID").val() == "") {
    			alert("아이디 입력!!!");
    			return;
    		} else if($("#inputPwd").val() == "") {
    			alert("비밀번호 입력!!!");
    			return;
    		} else {
    			$("#userloginform").attr("action", "${root}/user/login").submit();
    		}
    	});
    	
    	// 회원가입
    	$("#btnJoin").click(function() {
    		if($("#newUserID").val() == "") {
    			alert("아이디를 입력하세요");
    			return;
    		} else if($("#newPassword").val() == "") {
    			alert("비밀번호를 입력하세요");
    			return;
    		} else if($("#newName").val() == "") {
    			alert("이름을 입력하세요");
    			return;
    		} else if($("#newEmail").val() == "") {
    			alert("이메일을 입력하세요");
    			return;
    		} else if($("#address").val() == "") {
    			alert("주소를 입력하세요");
    			return;
    		} else{
    			let registerinfo = JSON.stringify({
    				"username" : $("#newName").val(), 
    				"userid" : $("#newUserID").val(), 
    				"password" : $("#newPassword").val(), 
    				"email" : $("#newEmail").val(), 
    				"address" : $("#address").val()
    			   });
    			$.ajax({
    				url:'${root}/user/signup',  
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
    					$("#signupModal").modal("hide");
    					makeList(users);
    				},
    				error:function(xhr,status,msg){
    					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
    				}
    			});
    		}
			
		});

    	// 비밀번호 찾기
    	$('#btnFindPass').click(function() {
    		if($("#findpw-userid").val() == "") {
    			alert("아이디 입력!!!");
    			return;
    		} else if($("#findpw-email").val() == "") {
    			alert("이메일 입력!!!");
    			return;
    		} else {
    			$("#findPasswordform").attr("action", "${root}/user/findpassword").submit();
    		}
    		
    	});
    });

    </script>
   
    <!-- 로그인 Modal Start -->
	<div class="modal" id="loginModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">로그인</h3>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<form id="userloginform" method="post" action="">
	      	<input type="hidden" name="action" value="login">
			    <div class="form-group">
			      <label for="ID">아이디</label>
			      <input id="inputID" type="text" class="form-control" name="userid" placeholder="아이디를 입력하세요.">
			    </div>
			    <div class="form-group">
			      <label for="password">
			      	비밀번호
			      	<span class="text-end"><a id="navFindpw" class="nav-link navFindpw" type="button" data-toggle="modal" data-target="#findPasswordModal">비밀번호 찾기</a></span>
			      </label>
			      <input id="inputPwd" type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요.">
			    </div>
			  </form>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" id="btnLogin" class="btn btn-primary btn-block" data-dismiss="modal">Login</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	<!-- 로그인 Modal End -->
	
	
	<!-- 비밀번호 찾기 Modal Start -->
	<div class="modal" id="findPasswordModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">비밀번호 찾기</h3>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<form id="findPasswordform" action="" method="post">
	      	<input type="hidden" name="action" value="login">
			    <div class="form-group">
			      <label for="ID">아이디</label>
			      <input id="findpw-userid" type="text" class="form-control" name="userid" placeholder="아이디를 입력하세요.">
			    </div>
			    <div class="form-group">
			      <label for="email">이메일 </label>
			      <input id="findpw-email" type="text" class="form-control" name="email" placeholder="이메일을 입력하세요.">
			    </div>
			  </form>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" id="btnFindPass" class="btn btn-primary btn-block" data-dismiss="modal">비밀번호 찾기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	<!-- 비밀번호찾기 Modal End -->
	
	
	<!-- 회원가입 Modal Start -->
	<div class="modal" id="signupModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">회원가입</h3>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
			<form id="userinsertform" action="" method="post">
			<input type="hidden" name="action" value="signup">
			    <div class="form-group">
			      <label for="ID">아이디 (20자 이내)</label>
			      <input type="text" class="form-control" placeholder="사용할 아이디를 입력하세요." id="newUserID" name="userid" 
			      			 onkeyup="noSpaceForm(this); textLength(this, 20);" onchange="noSpaceForm(this); textLength(this, 20);">
			    </div>
			    <div class="form-group">
			      <label for="password">비밀번호 (20자 이내)</label>
			      <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="newPassword" name="password"
			      			 onkeyup="noSpaceForm(this); textLength(this, 20);" onchange="noSpaceForm(this); textLength(this, 20);">
			    </div>
			    <!-- 
			    <div class="form-group">
			      <label for="password2">User Password Confirm (* 20자 이내)</label>
			      <input type="password" class="form-control" placeholder="Password" id="password2"
			      			 onkeyup="noSpaceForm(this); textLength(this, 20);" onchange="noSpaceForm(this); textLength(this, 20);">
			    </div> -->
			    <div class="form-group">
			      <label for="name">이름 (10자 이내)</label>
			      <input type="text" class="form-control" placeholder="이름을 입력하세요." id="newName" name="username" 
			      			 onkeyup="noSpaceForm(this); textLength(this, 10);" onchange="noSpaceForm(this); textLength(this, 10);">
			    </div>
			    <div class="form-group">
			      <label for="name">이메일(20자 이내)</label>
			      <input type="text" class="form-control" placeholder="이메일을 입력하세요." id="newEmail" name="email" 
			      			 onkeyup="noSpaceForm(this); textLength(this, 20);" onchange="noSpaceForm(this); textLength(this, 10);">
			    </div>
			    <div class="form-group">
			      <label for="address">주소</label>
			      <input type="text" class="form-control" placeholder="클릭!" id="address" name="address" onclick="execDaumPostcode(this)" readonly>
			    </div>
			    <div class="form-group">
			      <label for="address2">상세 주소 (50자 이내)</label>
			      <input type="text" class="form-control" placeholder="상세 주소를 입력하세요." id="address2" name="address2" 
			      			 onkeyup="noSpaceForm(this); textLength(this, 50);" onchange="noSpaceForm(this); textLength(this, 50);">
			    </div>
			    
			    <!--<div>집을 알아볼 때 중요하게 생각하는 것을 차례대로 선택해주세요.</div>
			    <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">사이트맵</a>
			        <div class="dropdown-menu">
			          <a class="dropdown-item" href="${root }/tradingIngormation">거래정보 검색</a>
			          <a class="dropdown-item" href="#" onclick="myRegion()">관심지역 정보</a>
			          <a class="dropdown-item" href="#" onclick="myRegion()">공지사항</a>
			          <div class="dropdown-divider"></div>
			        </div>
	     		</li>
			    
			     <div id="container">
					<ul>
						<li>
					        ▼
					        <ul class="menu2_s submenu">
					            <li>메뉴 2-1</li>
					            <li>메뉴 2-2</li>
					            <li>메뉴 2-3</li>
					        </ul>   
					    </li>
				    </ul>
			    </div> -->
			    
			</form>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
			<button type="button" class="btn btn-block btn-primary" id="btnJoin">JOIN IN</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	<!-- 회원가입 Modal End -->
	
	
	<!--  아파트 상세 거래 내역  --> 
<div class="modal fade" id="aptInfoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center">아파트 상세정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-borderless">
        	<tr style="display: none">
        		<td id="modal-aptNo"></td>
        	</tr>
        	<tr>
        		<th scope="col">아파트이름: </th>
        		<td id="aptName"></td>
        	</tr>
        	<tr>
        		<th scope="col">주소: </th>
        		<td id="address"></td>
        	</tr>
        	<tr>
        		<th scope="col">면적: </th>
        		<td id="area"></td>
        	</tr>
        	<tr>
        		<th scope="col">거래가: </th>
        		<td id="dealAmount"></td>
        	</tr>
        	<tr>
        		<th scope="col">거래일: </th>
        		<td id="dealDate"></td>
        	</tr>
        	<tr>
        		<th scope="col">층수: </th>
        		<td id="floor"></td>
        	</tr>
        	<tr>
        		<th scope="col">시공일: </th>
        		<td id="buildYear"></td>
        	</tr>
		</table>
		<div class="text-right">
			<i id="favorite-icon" class="fab fa-gratipay fa-3x favorite" data-toggle="tooltip" data-placement="top" title="관심지역 제거" style="display:none;" onclick="removeFavorite()"></i>
			<i id="favorite-icon" class="fab fa-gratipay fa-3x not-favorite" data-toggle="tooltip" data-placement="top" title="관심지역 추기" onclick="addFavorite()"></i>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>