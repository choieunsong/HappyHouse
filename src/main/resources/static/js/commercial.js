$(function(){
	console.log('init pos');
	addSearchPosToMap();
});

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
	{
		latlng: new kakao.maps.LatLng(37.6658609, 127.0317674),
		content: '도봉구'
	},
	{
		latlng: new kakao.maps.LatLng(37.6176125, 126.9227004),
		title: '은평구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5838012, 127.0507003),
		title: '동대문구'
	},
	{
		latlng: new kakao.maps.LatLng(37.4965037, 126.9443073),
		title: '동작구'
	},
	{
		latlng: new kakao.maps.LatLng(37.4600969, 126.9001546),
		title: '금천구'
	},
	{
		latlng: new kakao.maps.LatLng(37.4954856, 126.858121),
		title: '구로구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5990998, 126.9861493),
		title: '종로구'
	},
	{
		latlng: new kakao.maps.LatLng(37.6469954, 127.0147158),
		title: '강북구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5953795, 127.0939669),
		title: '중랑구'
	},
	{
		latlng: new kakao.maps.LatLng(37.4959854, 127.0664091),
		title: '강남구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5657617, 126.8226561),
		title: '강서구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5579452, 126.9941904),
		title: '중구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5492077, 127.1464824),
		title: '강동구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5481445	,	127.0857528),
		title: '광진구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5622906	,	126.9087803	),
		title: '마포구'
	},
	{
		latlng: new kakao.maps.LatLng(37.4769528	,	127.0378103	),
		title: '서초구'
	},
	{
		latlng: new kakao.maps.LatLng(37.606991	,	127.0232185	),
		title: '성북구'
	},
	{
		latlng: new kakao.maps.LatLng(37.655264	,	127.0771201	),
		title: '노원구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5048534	,	127.1144822	),
		title: '송파구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5820369	,	126.9356665	),
		title: '서대문구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5270616	,	126.8561534	),
		title: '양천구'
	},
	{
		latlng: new kakao.maps.LatLng(37.520641	,	126.9139242	),
		title: '영등포구'
	},
	{
		latlng: new kakao.maps.LatLng(37.4653993	,	126.9438071	),
		title: '관악구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5506753	,	127.0409622	),
		title: '성동구'
	},
	{
		latlng: new kakao.maps.LatLng(37.5311008	,	126.9810742	),
		title: '용산구'
	}
];


// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다0
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
	 	center: new kakao.maps.LatLng(37.5579452, 126.9941904), 
        level: 9 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 

///////////////////////////////////////
var searchMarkers = [];

function addSearchPosToMap(){
	for(var i  = 0; i  < positions.length; i++){
		let searchMarker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
		
		// 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div class="label"><span class="center">' + positions[i].content + '</span> </div>'// 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(searchMarker, 'mouseover', makeOverListener(map, searchMarker, infowindow));
	    kakao.maps.event.addListener(searchMarker, 'mouseout', makeOutListener(infowindow));
//	    kakao.maps.event.addListener(searchMarker, 'click', zoomIn(map));
	    
	    searchMarkers.push(searchMarker);
	}
}

// 기존 마커 지우기 
function removeSearchMarkers(){
	for(var i = 0; i < searchMarkers.length; i++){
		searchMarkers[i].setMap(null);
	}
}

function setCenter(lat, lng){
	var moveLatLng =  new kakao.maps.LatLng(lat, lng);
	map.setCenter(moveLatLng);
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

//줌인
function zoomIn(map){
	console.log('zoomin');
	let level = map.getLevel();
	// 지도를 1레벨 내립니다 (지도가 확대됩니다)
    map.setLevel(level - 1);
}

//////////////////////////////////////////
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

function addressMark(coronaList, hospitalName){
	removeSearchMarkers();
	for(var idx=0; idx<coronaList.length; idx++){
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(coronaList[idx], function(result, status) {
			var imageSrc = './img/hospital.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(20, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
			
			// 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image: markerImage // 마커이미지 설정 
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        /*var infowindow = new kakao.maps.InfoWindow({
		            //content: '<div style="width:150px;text-align:center;padding:6px 0;">'+hospitalName[idx]+'</div>'
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">🚑선별진료소🚑</div>'
		        });*/
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	}
}

