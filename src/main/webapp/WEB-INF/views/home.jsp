<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>SSAFY HappyHouse</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${root}/css/bootstrap.css" />
    <link rel="stylesheet" href="${root}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${root}/css/main.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="${root}/css/font.css"/>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src='${root}/js/home.js'></script>

	<c:if test="${not empty msg}">
		<script>
			var message = "${msg}";
			alert(message);
		</script>
	</c:if>
  </head>
<body>


 <!-- 상단 Header Start  -->
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <!-- 상단 Header End  -->

    
	<!-- 중앙 Contents Start  -->
	<div style="margin-top:300px">
	<div class="jumbotron text-center mb-4" style="margin-bottom:0; height: 400px; background-image:url(img/house_main.jpg); background-size:100%; background-position: center center"></div>
	
    <div class="container text-center pt-5 " style="margin-top:10px; height:360px; display: none;">
     <div>
	 	<span>
	 	  <select class="p-2 mr-1 border border-gray rounded">
		    <option value="id">전체 도/광역시</option>
		  </select>
	 	</span>
	 	<span>
	 	  <select class="p-2 mr-1 border border-gray rounded">
		    <option value="id">전체 시/구/군</option>
		  </select>
	 	</span>
	 	<span>
	 	  <select class="p-2 mr-1 border border-gray rounded">
		    <option value="id">전체 동</option>
		  </select>
	 	</span>
	 	<span>
	 	  <button type="button" class="btn btn-success" onClick="location.href='tradingInformation.html'">검색</button>
	 	</span>
	 </div>
    </div>
    
    <section class="py-5">
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <h2>Full Width Backgrounds</h2>
                    <p class="lead">거래정보 검색 페이지로 이동하시면 지역별 거래정보와 아파트별 거래정보를 검색해볼 수 있습니다.</p>
                    <p class="mb-0">The universe is almost 14 billion years old, and, wow! Life had no problem starting here on Earth! I think it would be inexcusably egocentric of us to suggest that we're alone in the universe.</p>
                </div>
            </div>
        </div>
    </section>
    <!-- 중앙 Contents End  -->
</div>

    <!-- 하단 Footer Start  -->
   	<%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- 하단 Footer End  -->
    
   <!-- 모달 -->
   	<%@include file="/WEB-INF/views/modal.jsp" %>
  </body>
</html>