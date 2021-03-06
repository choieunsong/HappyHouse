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
     <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <script type="text/javascript" src='${root}/js/tradingInformation.js'></script>
    <script type="text/javascript" src='${root}/js/home.js'></script>
    <script type="text/javascript" src='${root}/js/popper.min.js'></script>
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
            <h2 id='deal-title'>?????? ??????</h2>
            <!-- ?????? ??????  -->
            <div>
                <!-- ????????? ?????? -->
                <div class="radio-group text-align-right mb-4">
                    <div class="form-check-inline">
                        <label class="form-check-label" for="radio-dong">
                            <input type="radio" class="form-check-input" id="radio-dong" name="optradio" value="dong" checked>?????? ??????
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="radio-apt">
                            <input type="radio" class="form-check-input" id="radio-apt" name="optradio" value="apt">???????????? ??????
                        </label>
                    </div>
                </div>

                <div class="dong-view mt-2">
                <!-- ?????? ?????? dropdown -->
                    <div class="dropdown-group row justify-content-center">
                        <div class="dropdown col-sm-3">
                             <select class="form-control btn-outline-secondary dropdown-toggle btn-block text-center" name="city" id="city">
                             <option value="all" >???/?????????</option>
                              <option value="???????????????" >?????????</option>
                              <option value="?????????" >?????????</option>
                              <option value="???????????????" >???????????????</option>
                              <option value="???????????????" >???????????????</option>
                              <option value="???????????????" >???????????????</option>
                              <option value="???????????????" >???????????????</option>
                              <option value="???????????????" >???????????????</option>
                              <option value="?????????????????????" >?????????</option>
                              <option value="???????????????" >???????????????</option>
                              <option value="?????????" >?????????</option>
                              <option value="????????????" >????????????</option>
                              <option value="????????????" >????????????</option>
                              <option value="????????????" >????????????</option>
                              <option value="????????????" >????????????</option>
                              <option value="????????????" >????????????</option>
                              <option value="?????????????????????" >?????????</option>
                         </select>
                        </div>
                        

                        <div class="dropdown col-sm-3">
                           <div class="form-group md-1">
                            <select class="form-control btn-outline-secondary dropdown-toggle btn-block text-centerl" name="dongcode" id="gu">
                              <option value="all" >???/???/???</option>
                              <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="????????????">????????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="??????">??????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="????????????">????????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                             <option value="?????????">?????????</option>
                            </select>
                          </div>
                        </div>
                        
                        <div class="dropdown col-sm-3">
                           <div class="form-group md-1">
                            <select class="form-control btn-outline-secondary dropdown-toggle btn-block text-centerl" name="dong" id="dong">
                              <option value="all" >???</option>
                            </select>
                          </div>
                        </div>
                        <!-- dropdown col-sm-3 -->
                        <div class="col-sm-3 no-padding">
                           <!-- <div class="form-group col-md-6"> -->
                           	<button type="button" id="area-search" class="form-control btn-primary col-md-5" style="float:left" value="${root}">??????</button>
                           <!-- </div> -->
                           <!-- <div class = "form-group col-md-6"> -->
                           		<button type="button" class="form-control btn-outline-info col-md-7" id="corona-search" style="float:left" value="${root}">???????????????????????</button>
	                       <!-- </div> -->
                        </div>
                    </div>
               </div>

                <div class="apt-view mt-2" style="display: none;">
                    <div class = "row" style="margin: 0 0 20px auto;">
                        <input type="text" class="form-control col-sm-9 pd-2" placeholder="???????????? ??????" id="apt-input">
                        <button type="button" class="btn btn-primary btn-block col-sm-3 " id="apt-search">??????</button>
                    </div>
                </div>
                
                <!-- ????????? -->
                <div class="map_wrap">
                <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                <ul id="category">
                    <li id="BK9" data-order="0"> 
                        <span class="category_bg bank"></span>
                        ??????
                    </li>       
                    <li id="MT1" data-order="1"> 
                        <span class="category_bg mart"></span>
                        ??????
                    </li>  
                    <li id="PM9" data-order="2"> 
                        <span class="category_bg pharmacy"></span>
                        ??????
                    </li>  
                    <li id="OL7" data-order="3"> 
                        <span class="category_bg oil"></span>
                        ?????????
                    </li>  
                    <li id="CE7" data-order="4"> 
                        <span class="category_bg cafe"></span>
                        ??????
                    </li>  
                    <li id="CS2" data-order="5"> 
                        <span class="category_bg store"></span>
                        ?????????
                    </li>      
                </ul>
            </div>

            
               
                <div class = "row mt-5">
                    <h3 class="text-secondary ml-3 mr-auto" id ="current-area"> </h3>
                    <button type="button" class="btn btn-primary" id = "area-add" style="display: none;">?????? ?????? ??????</button> 
                </div>
            
            <input type="hidden" name="pg" id="pg" value="">
                <table class="table table-hover mt-2">
                    <thead>
                      <tr>
                         <th style="display: none;">no</th>
                         <th>???</th>
                        <th>??????</th>
                        <th>????????????</th>
                        <th>????????????</th>
                        <th>??????</th>
                        <th>?????????</th>
                        <th>????????????</th>
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

   <!-- ?????? Footer Start  -->
      <%@include file="/WEB-INF/views/footer.jsp" %>
    
   <!-- ?????? -->
      <%@include file="/WEB-INF/views/modal.jsp" %>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d2d848495108af4b2b93c70751c2ac3&libraries=services,clusterer,drawing"></script>
      <script type="text/javascript" src='${root }/js/commercial.js'></script>
</body>
</html>