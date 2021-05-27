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
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="${root}/css/font.css"/>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

<!-- style="width:80%; margin-left:auto; margin-right:auto" -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="https://static.wixstatic.com/media/ae60a7_d68c3214635c4a08ad89436dd477a464~mv2.jpg/v1/fill/w_956,h_340,al_c,q_80,usm_0.66_1.00_0.01/ae60a7_d68c3214635c4a08ad89436dd477a464~mv2.webp" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/house1_main.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/house2_main.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

    
    <section class="py-5">
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <h2>🏙 CHOICHOI HOUSE 🏙</h2>
                    <p class="lead">로그인 후, 거래정보 검색 페이지를 통해 지역별 거래정보와 아파트별 거래정보를 검색해볼 수 있습니다.</p>
                    <p class="mb-0"></p>
                </div>
            </div>
        </div>
    </section>
    <!-- 중앙 Contents End  -->


	<div class="container text-center">
	  <h3>TEAM</h3>
	  <p>choichoi house 팀 원</p>
	  <br>
	  <div class="row">
	    <div class="col-sm-6">
	      <p><strong>최민경</strong></p><br>
	      <img src="img/mk.png" style="width:40%" alt="최민경">
	    </div>
	    <div class="col-sm-6">
	      <p><strong>최은송</strong></p><br>
	      <img src="img/es.png" style="width:40%" alt="최은송">
	    </div>
	  </div>
	</div>

    <!-- 하단 Footer Start  -->
   	<%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- 하단 Footer End  -->
    
   <!-- 모달 -->
   	<%@include file="/WEB-INF/views/modal.jsp" %>
  </body>
</html>