<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>SSAFY HappyHouse</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/main.css" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src='js/tradingInformation.js'></script>
    <script type="text/javascript" src='js/home.js'></script>
    
    <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQNYJGXUNDcJDpAZUWg8MV4nh27G5S5hM&callback=initMap&libraries=&v=weekly"></script>
    <script>

    var locations =[];
    <c:choose>
    	<c:when  test='${!empty houses}'>
    		<c:forEach items='${houses}' var='house'>
    			locations.push(['${house.aptName}', '${house.lat}', '${house.lng}'])
    		</c:forEach>
    	</c:when>
    	<c:otherwise>
    		locations = [
    			  	['도봉구'	,	37.6658609	,	127.0317674	],
    				 ['은평구'	,	37.6176125	,	126.9227004	],
    				 ['동대문구'	,	37.5838012	,	127.0507003	],
    				 ['동작구'	,	37.4965037	,	126.9443073	],
    				 ['금천구'	,	37.4600969	,	126.9001546	],
    				 ['구로구'	,	37.4954856	,	126.858121	],
    				 ['종로구'	,	37.5990998	,	126.9861493	],
    				 ['강북구'	,	37.6469954	,	127.0147158	],
    				 ['중랑구'	,	37.5953795	,	127.0939669	],
    				 ['강남구'	,	37.4959854	,	127.0664091	],
    				 ['강서구'	,	37.5657617	,	126.8226561	],
    				 ['중구'	,	37.5579452	,	126.9941904	],
    				 ['강동구'	,	37.5492077	,	127.1464824	],
    				 ['광진구'	,	37.5481445	,	127.0857528	],
    				 ['마포구'	,	37.5622906	,	126.9087803	],
    				 ['서초구'	,	37.4769528	,	127.0378103	],
    				 ['성북구'	,	37.606991	,	127.0232185	],
    				 ['노원구'	,	37.655264	,	127.0771201	],
    				 ['송파구'	,	37.5048534	,	127.1144822	],
    				 ['서대문구'	,	37.5820369	,	126.9356665	],
    				 ['양천구'	,	37.5270616	,	126.8561534	],
    				 ['영등포구'	,	37.520641	,	126.9139242	],
    				 ['관악구'	,	37.4653993	,	126.9438071	],
    				 ['성동구'	,	37.5506753	,	127.0409622	],
    				 ['용산구'	,	37.5311008	,	126.9810742	]
    		 ];
    	</c:otherwise>
    </c:choose>
    
    <c:choose>
 		<c:when test='${!empty mainAttent}'>
				var lat = ${mainAttent.lat}
				var lng = ${mainAttent.lng}
				var zoom = 15
		</c:when>
		<c:otherwise>
			var lat = 37.606991
			var lng = 127.0232185
			var zoom = 11
		</c:otherwise>
	</c:choose>

    	var map = null;
    	var latitude;
    	var longitude;

        function initMap() {
        	var opt = {
					// google map에 중앙으로 표시할 좌표 설정
					center : {lat:lat,lng: lng},
					zoom : zoom,  //0~ 21  큰 값일 수록  zooming
					};
            map = new google.maps.Map(document.getElementById("map"), opt);
            var infowindow = new google.maps.InfoWindow();

		    var marker, i;
		    for (i = 0; i < locations.length; i++) {  
		      marker = new google.maps.Marker({
			        id:i,
			        title : locations[i][0],
			        label : locations[i][0],
			        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			        map: map
		      });

		      google.maps.event.addListener(marker, 'click', (function(marker, i) {
		        return function() {
		          infowindow.setContent(locations[i][0]);
		          infowindow.open(map, marker);
		        }
		      })(marker, i));
		      
		      if(marker) {
		        marker.addListener('click', function() {
		        	console.log(this.title);
		      	    map.setZoom(15);
		        	 map.panTo(this.getPosition());
		       	 });
		       }
		    }
		}
        

        function myRegion() {
        	alert("준비중입니다!");
        }
    </script>
    <style>
        #map{
            height: 100%;
        }
    </style>
    
 
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div class = "container mt-5">
        <div class = "container">
            <h2 id='deal-title'>거래 정보</h2>
            <!-- 거래 정보  -->
            <div>
                <!-- 라디오 버튼 -->
                <div class="radio-group text-align-right">

                    <div class="form-check-inline">
                        <label class="form-check-label" for="radio-dong">
                            <input type="radio" class="form-check-input" id="radio-dong" name="optradio" value="dong" checked>동별 검색
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="radio-apt">
                            <input type="radio" class="form-check-input" id="radio-apt" name="optradio" value="apt">아파트별 검색
                        </label>
                    </div>
                </div>

                <div class="dong-view mt-2">
                <!-- 지역 선택 dropdown -->
                    <div class="dropdown-group row justify-content-center">
                        <div class="dropdown col-sm-3">
                             <select class="form-control btn-outline-secondary dropdown-toggle btn-block text-center" name="city" id="city">
			                	 <option value="all" >도/광역시</option>
				                  <option value="서울특별시" >서울시</option>
				                  <option value="경기도" >경기도</option>
				                  <option value="인천광역시" >인천광역시</option>
				                  <option value="부산광역시" >부산광역시</option>
				                  <option value="대전광역시" >대전광역시</option>
				                  <option value="대구광역시" >대구광역시</option>
				                  <option value="울산광역시" >울산광역시</option>
				                  <option value="세종특별자치시" >세종시</option>
				                  <option value="광주광역시" >광주광역시</option>
				                  <option value="강원도" >강원도</option>
				                  <option value="충청북도" >충청북도</option>
				                  <option value="경상북도" >경상북도</option>
				                  <option value="경상남도" >경상남도</option>
				                  <option value="전라북도" >전라북도</option>
				                  <option value="전라남도" >전라남도</option>
				                  <option value="제주특별자치도" >제주도</option>
			                </select>
                        </div>
                        

                        <div class="dropdown col-sm-3">
                        	<div class="form-group md-1">
				                <select class="form-control btn-outline-secondary dropdown-toggle btn-block text-centerl" name="dongcode" id="gu">
				                  <option value="all" >시/구/군</option>
				                  <option value="도봉구">도봉구</option>
							        <option value="은평구">은평구</option>
							        <option value="동대문구">동대문구</option>
							        <option value="동작구">동작구</option>
							        <option value="금천구">금천구</option>
							        <option value="구로구">구로구</option>
							        <option value="종로구">종로구</option>
							        <option value="강북구">강북구</option>
							        <option value="중랑구">중랑구</option>
							        <option value="강남구">강남구</option>
							        <option value="강서구">강서구</option>
							        <option value="중구">중구</option>
							        <option value="강동구">강동구</option>
							        <option value="광진구">광진구</option>
							        <option value="마포구">마포구</option>
							        <option value="서초구">서초구</option>
							        <option value="성북구">성북구</option>
							        <option value="노원구">노원구</option>
							        <option value="송파구">송파구</option>
							        <option value="서대문">서대문</option>
							        <option value="양천구">양천구</option>
							        <option value="영등포구">영등포구</option>
							        <option value="관악구">관악구</option>
							        <option value="성동구">성동구</option>
							        <option value="용산구">용산구</option>
				                </select>
				              </div>
                        </div>
                        
                        <div class="dropdown col-sm-3">
                        	<div class="form-group md-1">
				                <select class="form-control btn-outline-secondary dropdown-toggle btn-block text-centerl" name="dong" id="dong">
				                  <option value="all" >동</option>
				                </select>
				              </div>
                        </div>
                        
                        <div class="dropdown col-sm-3">
                        	<div class="form-group md-1">
                        		<button type="button" id="area-search" class="form-control btn-primary" value="${root}">검색</button>
                        	</div>
                        </div>
                    </div>
                </div>

                <div class="apt-view mt-2" style="display: none;">

                    <div class = "row">
                        <input type="text" class="form-control col-sm-9 pd-2" placeholder="아파트명 검색" id="apt-input">
                        <button type="button" class="btn btn-primary btn-block col-sm-3 " id="apt-search">검색</button>
                    </div>

                      
                </div>
                <!-- 구글 지도  -->
                <div class="mt-3" style="height :500px">
                    <div id="map"></div>
                 
                </div>

                <div class = "row mt-5">
                    <h3 class="text-secondary ml-3 mr-auto" id ="current-area"> </h3>
                    <button type="button" class="btn btn-primary" id = "area-add" style="display: none;">관심 지역 추가</button> 
                </div>
				
				<input type="hidden" name="pg" id="pg" value="">
                <table class="table table-hover mt-2">
                    <thead>
                      <tr>
                      	<th>동</th>
                        <th>이름</th>
                        <th>거래금액</th>
                        <th>전용면적</th>
                        <th>거래구분</th>
                        <th>거래일</th>
                      </tr>
                    </thead>
                    <tbody id="table-body">
                    
                    </tbody>
                </table>
                
            	<table class="table table-hover mt-2" name="navi" id="navi">
              		<tr>
              			<td></td>
              		</tr>
             	</table>
               	
            </div>
            
        </div>
    </div>

   <!-- 하단 Footer Start  -->
   	<%@include file="/WEB-INF/views/footer.jsp" %>
    
   <!-- 모달 -->
   	<%@include file="/WEB-INF/views/modal.jsp" %>
</body>
</html>