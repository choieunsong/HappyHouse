
var aptList = [];		//아파트 정보 리스트 
var favoriteList = [];	//관심지역 리스트
var favIdx;				// 삭제할 관심지역 인덱스 

$(function(){
	//favoriteList에 값 넣어주기 
	initFavoriteList();
	
	// tooltip
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
	
	$('#radio-dong').click(function() {
		$(".dong-view").css("display", "block");
		$(".apt-view").css("display", "none");
	})
	$('#radio-apt').click(function() {
		$(".dong-view").css("display", "none");
		$(".apt-view").css("display", "block");
	})
	
	// 페이지 이동 
	$(document).on("click", ".page-item", function(){
		var pg = $(this).attr("data-pg");
		console.log("클릭, 페이지 넘버: "+ pg);
		// 아파트별인지 동별인지 구분 
		// 키워드, 페이지번호 넘겨주기 
		if($('#radio-dong').is(':checked')){
			var dong = $('#dong').val();
			console.log('동으로 검색: ' + dong);
			searchByDong(dong, pg);
		}else{
			aptName = $('#apt-input').val();
			console.log("aptName: " + aptName);
			searchByApt(aptName, pg);
		}
	});
	
	// 도시 선택 
	$('#city').change(function(){
		var city = $(this).val();
		console.log('city 선택', city);
		$.ajax({
			url: 'deal/searchGu/'+ city,
			type: 'GET',
			contentType: 'application/json;charset=utf-8',
			dataType: 'json',
			success: function(data){
				processGuResult(data);
			},
			error: function(xhr, status, err){
				console.log(err);
			}
		});
	})
	
	//시군구 선택 
	$('#gu').change(function(){
		var gu = $(this).val();
		console.log('gu (시군구)선택',gu)
		$.ajax({
			 url: 'deal/searchDong/' + gu,
			 type: 'GET',
			 contentType: 'application/json;charset=utf-8',
			 dataType:'json',
			 success : function(jsondata){
				 processDongResult(jsondata);
			 },
			 error: function(xhr, status, err){
					console.log(err);
			}
		})
	})
	
	// 동네로 검색(검색 버튼 눌렀을 때) 
	$('#area-search').on('click', function() {
		var dong = $('#dong').val();
		console.log('동으로 검색: ' + dong);
		searchByDong(dong, 1);
	});
	
	// 아파트로 검색 
	$('#apt-search').on('click', function() {
		aptName = $('#apt-input').val();
		console.log("aptName: " + aptName);
		searchByApt(aptName, 1);
	});
	
	// 코로나 선별소 검색
	$('#corona-search').on('click', function() {
		var dong = $('#dong').val();
		console.log('동으로 코로나 검색: ' + dong);
		searchCorona(dong, 1);
	});

	$('#area-add').on('click', function(){
		alert("준비중입니다 !");
	})
	
	// 아파트 상세 정보 띄우기(모달창) 
	$("#table-body").on("click", ".apt-row", function(event){
		
		let aptNo = $(this).find("td").first().text().trim();
		
		let idx;
		for(let i = 0; i < aptList.length; i++){
			if(aptList[i].no == aptNo) {
				$('#modal-aptNo').text(aptList[i].no);
				$('#aptInfoModal #aptName').text(aptList[i].aptName);
				let address = `${aptList[i].city} ${aptList[i].gugun} ${aptList[i].dong} ${aptList[i].jibun}번지`;
				$('#aptInfoModal #address').text(address);
				$('#aptInfoModal #area').text(aptList[i].area);
				$('#aptInfoModal #dealAmount').text(aptList[i].dealAmount);
				let dealDate = `${aptList[i].dealYear}.${aptList[i].dealMonth}.${aptList[i].dealDay}`;
				$('#aptInfoModal #dealDate').text(dealDate);
				$('#aptInfoModal #floor').text(aptList[i].floor+"층");
				$('#aptInfoModal #buildYear').text(aptList[i].buildYear+"년");
				idx = i;
				break;
			}
		}
		console.log('idx: '+idx);
		// 하트이모티콘 색깔 설정 
		let flag = false;
		for(let i = 0; i < favoriteList.length; i++){
			console.log(favoriteList[i].dealno);
			if(favoriteList[i].dealno == aptList[idx].no){
				console.log('yes');
				$('#aptInfoModal .favorite').css("display","");
				$('#aptInfoModal .not-favorite').css("display","none");
				favIdx = i;
				flag = true;
				break;
			}
		}
		if(!flag){
			$('#aptInfoModal .favorite').css("display","none");
			$('#aptInfoModal .not-favorite').css("display","");
		}
		$('#aptInfoModal').modal('show');
	});
});


//관심지역 추가  
function addFavorite(){
	console.log("관심지역 추가");
	let arr2 = $('#aptInfoModal #address').text().split(" "),
		address = arr2[2],
		dealno = $('#aptInfoModal #modal-aptNo').text() * 1,
		aptName = $('#aptInfoModal #aptName').text();
		
	let data = {no:0, userno: 0, dealno: dealno, aptName: aptName, dong: address};
	console.log(data);
	$.ajax({
		 url: 'favorite',
		 type: 'POST',
		 contentType: 'application/json;charset=utf-8',
		 dataType:'json',
		 data: JSON.stringify(data),
		 success : function(jsondata){
			 if(jsondata =='success'){
				 console.log('추가 잘됨');
			 }else{
				 alert('관심 지역 추가하는데 오류가 발생했습니다.');
			 }
		 },
		 error: function(xhr, status, err){
				console.log(err);
		}
	});
	favoriteList.push(data);
	setHeartIcon(dealno, true);
}


//row 옆에 하트 추가하기 
function setHeartIcon(aptNo){
	console.log('하트 추가하');
	console.log("aptNo: "+aptNo);
	for(var i = 0; i < aptList.length; i++){
		// map이 true면 하트붙여주기 
		if(aptList[i].no == aptNo){
			console.log('i: '+i);
			break;
		}
	}
}

function findAptIdx(aptNo){
	for(var i = 0; i < aptList.length; i++){
		if(aptList[i].no == aptNo){
			console.log('i: '+i);
			return i;
		}
	}
}


//관심지역 제거  
function removeFavorite(){
	console.log("관심지역 제거");
	let no = favoriteList[favIdx].no;
	console.log(no);
	
	$.ajax({
		 url: 'favorite/' + no,
		 type: 'DELETE',
		 contentType: 'application/json;charset=utf-8',
		 dataType:'json',
		 success : function(jsondata){
			 if(jsondata =='success'){
				 console.log("제거 잘됨");
			 }else{
				 alert('관심 지역 제거하는 데 오류가 발생햇습니다.');
			 }
		 },
		 error: function(xhr, status, err){
				console.log(err);
		}
	});
	initFavoriteList();
}

//////////////////////////////////////////////

function searchByDong(dong, pg){
	$.ajax({
		 url: 'deal/searchHouse/' + dong +"/"+pg,
		 type: 'GET',
		 contentType: 'application/json;charset=utf-8',
		 dataType:'json',
		 success : function(jsondata){
			 searchResult(jsondata);
		 },
		 error: function(xhr, status, err){
				console.log(err);
		}
	});
}

function searchCorona(dong, pg){
	$.ajax({
		 url: 'deal/corona/' + dong +"/"+pg,
		 type: 'GET',
		 contentType: 'application/json;charset=utf-8',
		 dataType:'json',
		 success : function(jsondata){
			 //console.log("리졸투.."+jsondata.result);
			 makeList(jsondata);
			 //setLocation(jsondata.result);
			 addressMark(coronaList, hospitalName);
		 },
		 error: function(xhr, status, err){
			console.log(err);
		}
	});
}

var hospitalName=[], coronaList = []
function makeList(data){
	$(data.result).each(function(index, corona){
		console.log(corona.hospital);
		 coronaList.push(corona.address);
		 hospitalName.push(corona.hospital);
	})
}

function searchByApt(aptName, pg){
	if(aptName == ""){
		alert("아파트 이름 입력!!!!");
		return;
	}
	$('#current-area').text(aptName + " 검색결과");
	$('#area-add').css("display", "none");
	$.ajax({
		url: "deal/searchApt/" + aptName + "/" + pg,
		type: 'GET',
		contentType:'application/json;charset=utf-8',
		success: function(data){
			searchResult(data);
		},
		dataType:'json',
		error:function(xhr, status, err){
			console.log(err);
		}
	})
}

function processGuResult(jsondata){
	console.log('결과 도착 GU')
	console.log(jsondata)
	var contents = $('#gu');
	contents.empty();				//기존에 내용이 있으면 비우기 
	$('<option value="all">시/구/군</option>').appendTo(contents)
		$.each(jsondata, function(index, item) {
			$('<option value="'+item.dongcode+'">'+item.gugun+'</option>').appendTo(contents)
		})
}

function processDongResult(jsondata){
	console.log('결과 도착 DOGN')
	console.log(jsondata)
	var contents = $('#dong');
	contents.empty();				//기존에 내용이 있으면 비우기
	 $('<option value="all">동</option>').appendTo(contents)
		$.each(jsondata, function(index, item) {
			$('<option value="'+item.dong+'">'+item.dong+'</option>').appendTo(contents)
		});
}

function searchResult(data){
	console.log("search apt result");
	$('#table-body').empty();
	if(data == null){
		let str = `<tr><td>검색결과가 없습니다.</td></tr>`
		$('#table-body').append(str);
	}else{
		// 지도 마커 찍기 
		setLocation(data.result);
		
		// 바디 처리 
		console.log("바디처리"+data.result);
		aptList = [];
		$(data.result).each(function(index, apt){
			let flag = false;
			let str = `
			<tr class="apt-row">
				<td class="aptNo" style="display: none;">${apt.no}</td>
				<td>${apt.dong}</td>
				<td>${apt.aptName}</td>
				<td>${apt.dealAmount}</td>
				<td>${apt.area}</td>
				<td>${apt.floor}</td>
				<td>${apt.dealYear}.${apt.dealMonth}.${apt.dealDay} </td>`
				for(var i = 0; i < favoriteList.length; i++){
					// map이 true면 하트붙여주기 
					if(favoriteList[i].dealno == apt.no){
						str += `<td><i class="far fa-heart heart-icon favorite"></i></td>`
						flag = true;
						break;
					}
				}
				if(!flag){
					str += `<td><i class="far fa-heart heart-icon not-favorite"></i></td>`
				}
			str += `</tr>`
			console.log(str);
			$('#table-body').append(str);
			
			aptList.push(apt);
		});
		
		console.log(data.navi);
		// 네비 처리 
		$('#navi tr td').empty();
		$('#navi tr td').append(data.navi);
	}
}

// 지도에 마커 뿌려주는 함수 
function setLocation(data){
	searchFlag = true;
	
	// 기존 마커 지워주기 
	console.log("setLocation");
	positions = [];
	removeSearchMarkers();
	searchMarkders = [];
	
	// 새 마커 찍기 
	$(data).each(function(index, apt){
		
		positions.push({
			content:  `<div>${apt.aptName}</div>`,
			latlng: new kakao.maps.LatLng(apt.lat, apt.lng)
		});
	});
	addSearchPosToMap();
	
	// 중앙, level 설정 
	setCenter(data[0].lat, data[0].lng);
	map.setLevel(8);
}

//유저가 갖고 있는 favorite list 값 가져오기
function initFavoriteList(){
	favoriteList = [];
	$.ajax({
		 url: 'favorite',
		 type: 'GET',
		 contentType: 'application/json;charset=utf-8',
		 dataType:'json',
		 success : function(data){
			 console.log('가져오기 잘됨');
			 $(data).each(function(index, item){
				 console.log(item);
				 favoriteList.push(item);
			 });
			 console.log(favoriteList);
		 },
		 error: function(xhr, status, err){
				console.log(err);
		}
	});
	
	console.log(positions);
	//initMap();
}

