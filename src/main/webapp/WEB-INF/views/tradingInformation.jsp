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
    <link rel="stylesheet" href="css/api.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="${root}/css/font.css"/>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <script type="text/javascript" src='${root }/js/tradingInformation.js'></script>
    <script type="text/javascript" src='${root }/js/home.js'></script>
    <script type="text/javascript" src='${root }/js/popper.min.js'></script>
    
    <script>
        function myRegion() {
        	alert("준비중입니다!");
        }
    </script>
    <style>
        #map{
            height: 100%;
        }
        
        .not-favorite{
        	color: lightgray;
        }
	 	.not-favorite:hover{
        	color: pink;
        }
        
        .favorite{
        	color: pink;
        }
        
        .favorite:hover{
        	color: lightgray;
        }
        
    </style>
    
 
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div style="margin-top:100px">
        <div class = "container">
            <h2 id='deal-title'>거래 정보</h2>
            <!-- 거래 정보  -->
            <div>
                <!-- 라디오 버튼 -->
                <div class="radio-group text-align-right mb-4">
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
                    <div  class = "form-check-inline float-right">
						<button type="button" class="form-control btn-primary" id="corona-search" value="${root}">📢 코로나 선별진료소 확인하기 </button>
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
                        	<%-- <div  class = "form-group md-1">
								<button type="button" class="form-control btn-primary" id="corona-search" value="${root}">코로나 선별소 확인하기</button>
							</div> --%>
                        </div>
                        
                    </div>
<<<<<<< HEAD
=======
               <!--  </div> -->

                <div class="apt-view mt-2" style="display: none;">

                    <div class = "row" style="margin: 0 0 20px auto;">
                        <input type="text" class="form-control col-sm-9 pd-2" placeholder="아파트명 검색" id="apt-input">
                        <button type="button" class="btn btn-primary btn-block col-sm-3 " id="apt-search">검색</button>
                    </div>
                </div>
                
                <!-- 카카오 -->
                <div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <ul id="category">
				        <li id="BK9" data-order="0"> 
				            <span class="category_bg bank"></span>
				            은행
				        </li>       
				        <li id="MT1" data-order="1"> 
				            <span class="category_bg mart"></span>
				            마트
				        </li>  
				        <li id="PM9" data-order="2"> 
				            <span class="category_bg pharmacy"></span>
				            약국
				        </li>  
				        <li id="OL7" data-order="3"> 
				            <span class="category_bg oil"></span>
				            주유소
				        </li>  
				        <li id="CE7" data-order="4"> 
				            <span class="category_bg cafe"></span>
				            카페
				        </li>  
				        <li id="CS2" data-order="5"> 
				            <span class="category_bg store"></span>
				            편의점
				        </li>      
				    </ul>
				</div>

		                <div class="apt-view mt-2" style="display: none;">
		
		                    <div class = "row" style="margin: 0 0 20px auto;">
		                        <input type="text" class="form-control col-sm-9 pd-2" placeholder="아파트명 검색" id="apt-input">
		                        <button type="button" class="btn btn-primary btn-block col-sm-3 " id="apt-search">검색</button>
		                    </div>
		                </div>
		                
		                
		                <!-- 카카오 -->
		                <div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    <ul id="category">
						        <li id="BK9" data-order="0"> 
						            <span class="category_bg bank"></span>
						            은행
						        </li>       
						        <li id="MT1" data-order="1"> 
						            <span class="category_bg mart"></span>
						            마트
						        </li>  
						        <li id="PM9" data-order="2"> 
						            <span class="category_bg pharmacy"></span>
						            약국
						        </li>  
						        <li id="OL7" data-order="3"> 
						            <span class="category_bg oil"></span>
						            주유소
						        </li>  
						        <li id="CE7" data-order="4"> 
						            <span class="category_bg cafe"></span>
						            카페
						        </li>  
						        <li id="CS2" data-order="5"> 
						            <span class="category_bg store"></span>
						            편의점
						        </li>      
						    </ul>
						</div>
						
						<div  class = "mt-3 d-flex" style="align-right">
							<button type="button" class="btn btn-primary btn-block col-sm-3 ml-auto" id="corona-search" value="${root}">코로나 선별소 확인하기</button>
						</div>
				
					<!-- </div> -->
>>>>>>> branch 'master' of https://lab.ssafy.com/greatgelly96/happyhouse-final.git
               </div>

                <div class="apt-view mt-2" style="display: none;">

                    <div class = "row" style="margin: 0 0 20px auto;">
                        <input type="text" class="form-control col-sm-9 pd-2" placeholder="아파트명 검색" id="apt-input">
                        <button type="button" class="btn btn-primary btn-block col-sm-3 " id="apt-search">검색</button>
                    </div>
                </div>
                
                
                <!-- 카카오 -->
                <div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <ul id="category">
				        <li id="BK9" data-order="0"> 
				            <span class="category_bg bank"></span>
				            은행
				        </li>       
				        <li id="MT1" data-order="1"> 
				            <span class="category_bg mart"></span>
				            마트
				        </li>  
				        <li id="PM9" data-order="2"> 
				            <span class="category_bg pharmacy"></span>
				            약국
				        </li>  
				        <li id="OL7" data-order="3"> 
				            <span class="category_bg oil"></span>
				            주유소
				        </li>  
				        <li id="CE7" data-order="4"> 
				            <span class="category_bg cafe"></span>
				            카페
				        </li>  
				        <li id="CS2" data-order="5"> 
				            <span class="category_bg store"></span>
				            편의점
				        </li>      
				    </ul>
				</div>
				
				<%-- <div  class = "mt-3 d-flex" style="align-right">
					<button type="button" class="btn btn-primary btn-block col-sm-3 ml-auto" id="corona-search" value="${root}">코로나 선별소 확인하기</button>
				</div> --%>
				
					<!-- </div>
               </div>  -->
               
                <div class = "row mt-5">
                    <h3 class="text-secondary ml-3 mr-auto" id ="current-area"> </h3>
                    <button type="button" class="btn btn-primary" id = "area-add" style="display: none;">관심 지역 추가</button> 
                </div>
				
				<input type="hidden" name="pg" id="pg" value="">
                <table class="table table-hover mt-2">
                    <thead>
                      <tr>
                      	<th style="display: none;">no</th>
                      	<th>동</th>
                        <th>이름</th>
                        <th>거래금액</th>
                        <th>전용면적</th>
                        <th>층수</th>
                        <th>거래일</th>
                      </tr>
                    </thead>
                    <tbody id="table-body">
                    
                    </tbody>
                </table>
                
            	<table class="table table-hover mt-2" name="navi" id="navi" style="margin-left: auto; margin-right: auto;">
              		<tr>
              			<td style="text-align: center;"></td>
              		</tr>
              		
             	</table> 
             	
            </div>
            
        </div>
    </div>

   <!-- 하단 Footer Start  -->
   	<%@include file="/WEB-INF/views/footer.jsp" %>
    
   <!-- 모달 -->
   	<%@include file="/WEB-INF/views/modal.jsp" %>
   	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d2d848495108af4b2b93c70751c2ac3&libraries=services,clusterer,drawing"></script>
   	<script type="text/javascript" src='${root }/js/commercial.js'></script>
</body>
</html>