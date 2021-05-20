
$(function(){
	/*$('#btnLogin').click(function() {
		$.ajax({
			url:'./data/userlist.xml',
			success: loginResult,
			dataType:'xml',
			error:function(xhr, status, err){
				alert(err)
			}
		})
	})*/
	
/*	$('#btnJoin').click(function() {
		$.ajax({
			url:'./data/userlist.xml',
			success: checkID,
			dataType:'xml',
			error:function(xhr, status, err){
				alert(err)
			}
		})
	})*/	
});

function execDaumPostcode(obj) {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = ''; // 주소 변수
			
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
			
			// 주소 정보를 해당 필드에 넣는다.
			obj.value = addr;
			// 커서를 상세주소 필드로 이동한다.
			$("#address2").focus();
		}
	}).open();
}

/*function loginResult(data) {
	var loginSuccess=false;
	
	var no = $('no',data).text()
	var id = $('id',data).text()
	var name = $('name',data).text()
	var password = $('password',data).text()
	
	//console.log($('#inputID').val()+" "+id);
	//console.log($('#inputPwd').val()+" "+password);
	
	if($('#inputID').val()==id && $('#inputPwd').val()==password) {
		loginSuccess=true;
		$('.navLogin').css('display','none');
		$('.navSignup').css('display','none');
		$('.navAdmin').css('display','block');
		$('.navMypage').css('display','block');
		$('.navLogout').css('display','block');
		alert("로그인되었습니다.")
	}
	
	if(loginSuccess==false) alert("로그인에 실패하였습니다.")
}

function logoutResult() {
	$('.navLogin').css('display','block');
	$('.navSignup').css('display','block');
	$('.navAdmin').css('display','none');
	$('.navMypage').css('display','none');
	$('.navLogout').css('display','none');
}*/

function checkID(data) {
	var originID = $('id',data).text();
	console.log($('#newUserID').val()+" "+originID)
	if($('#newUserID').val()==originID) {
		alert("이미 등록된 아이디입니다. 다른 아이디를 입력하세요.")
	} else if($('#newUserID').val()=="" || $('#newPassword').val()=="" || 
			$('#newName').val()=="" || $('#address1').val()=="" || $('#address2').val()=="") {
		alert("입력하지 않은 란이 있습니다. 가입 정보를 모두 채워주세요!")
	} else alert("가입 성공!")
}
 

function noSpaceForm(obj) { 
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거됩니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
 // onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
}

function textLength(obj, num) {
  if(obj.value.length>20) {
	  alert("해당 항목에는 "+num+"자 이상 입력할 수 없습니다. \n\n"+num+"자 이후 글자는 자동적으로 제거됩니다.");
	  obj.focus();
	  obj.value = obj.value.substr(0, num);
  }
}

function myRegion() {
	alert("준비중입니다!");
}