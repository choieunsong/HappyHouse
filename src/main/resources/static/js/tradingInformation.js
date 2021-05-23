
var aptList = [];

$(function(){
	
	
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
	
	//동 선택 
		$('#gu').change(function(){
			var gu = $(this).val();
			console.log('gu 선택',gu)
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
	
	// 동네로 검색 
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

	$('#area-add').on('click', function(){
		alert("준비중입니다 !");
	})
	
	// 아파트 상세 정보 띄우기(모달창) 
	$("#table-body").on("click", ".apt-row", function(event){
		let aptNo = $(this).find("td").first().text().trim();
		console.log(aptNo);
		
		aptList.forEach(function(apt){
			if(apt.no == aptNo) {
				$('#aptInfoModal #aptName').text(apt.aptName);
				let address = `${apt.city} ${apt.gugun} ${apt.dong} ${apt.jibun}번지`;
				$('#aptInfoModal #address').text(address);
				$('#aptInfoModal #area').text(apt.area);
				$('#aptInfoModal #dealAmount').text(apt.dealAmount);
				let dealDate = `${apt.dealYear}.${apt.dealMonth}.${apt.dealDay}`;
				$('#aptInfoModal #dealDate').text(dealDate);
				$('#aptInfoModal #floor').text(apt.floor+"층");
				$('#aptInfoModal #buildYear').text(apt.buildYear+"년");
			}
		})
		
		$('#aptInfoModal').modal('show');
	});
	
	
});


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
	console.log('결과 도착')
	console.log(jsondata)
	var contents = $('#gu');
	contents.empty();				//기존에 내용이 있으면 비우기 
	$('<option value="all">시/구/군</option>').appendTo(contents)
		$.each(jsondata, function(index, item) {
			$('<option value="'+item.dongcode+'">'+item.gugun+'</option>').appendTo(contents)
		})
}

function processDongResult(jsondata){
	console.log('결과 도착')
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
//		console.log(data.result);
		aptList = [];
		$(data.result).each(function(index, apt){
			let str = `
			<tr class="apt-row">
				<td class="aptNo" style="display: none;">${apt.no}</td>
				<td>${apt.dong}</td>
				<td>${apt.aptName}</td>
				<td>${apt.dealAmount}</td>
				<td>${apt.area}</td>
				<td>${apt.floor}</td>
				<td>${apt.dealYear}.${apt.dealMonth}.${apt.dealDay} </td>
			</tr>`
//			console.log(str);
			$('#table-body').append(str);
			
			aptList.push(apt);
		});
		// 네비 처리 
		$('#navi tr td').empty();
//		console.log(data.navi);
		$('#navi tr td').append(data.navi);
	}
}

function setLocation(data){
	searchFlag = true;
	
	console.log("setLocation");
	locations = [];
	$(data).each(function(index, apt){
		locations.push([apt.dong, apt.lat, apt.lng, apt.aptName,apt.no, apt.area, apt.buildYear, apt.city, apt.dealAmount, 
			apt.dealDay, apt.dealMonth, apt.dealYear, apt.floor, apt.gugun, apt.jibun]);
	});
	console.log(locations);
	initMap();
}
