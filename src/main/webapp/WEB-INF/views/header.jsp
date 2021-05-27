<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top">
	  <!-- Brand/logo -->
	  <a class="navbar-brand" href="${root}">
		<img src="${root}/img/logo.png" alt="logo" style="width:80px;">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse d-flex" id="navbarColor01">
	    <ul class="navbar-nav my-auto mr-auto">
	    <c:if test = "${userinfo != null}">
	      <li class="nav-item">
	        <a class="nav-link" href="${root}/tradingInformation" style="font-size:15px">거래정보 검색</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${root}/favoriteLocation" style="font-size:15px">관심지역 정보</a>
	      </li>
	      </c:if>
	      <li class="nav-item">
	        <a class="nav-link" href="${root}/notice" style="font-size:15px">공지사항</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${root}/qna" style="font-size:15px">자유게시판</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="font-size:15px">사이트맵</a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="${root }/tradingIngormation" style="font-size:15px">거래정보 검색</a>
	          <a class="dropdown-item" href="${root}/favoriteLocation" style="font-size:15px">관심지역 정보</a>
	          <a class="dropdown-item" href="${root}/notice" style="font-size:15px">공지사항</a>
	          <a class="dropdown-item" href="${root}/qna" style="font-size:15px">자유게시판</a>
	        	<div class="dropdown-divider"></div>
	          
	       	 <!-- 로그인 안했을 때 보여야 할 부분  &로그인 했을 때 보여야할 부분 //style="display:block;"-->
	          <c:choose>
				<c:when test="${empty userinfo}">
				  <a id="navLogin" class="dropdown-item nav-link navLogin" type="button" data-toggle="modal" data-target="#loginModal" style="font-size:15px">Login</a>
				  <a id="navSignup" class="dropdown-item nav-link navSignup" type="button" data-toggle="modal" data-target="#signupModal" style="font-size:15px">SignUp</a>
				</c:when>
				<c:otherwise>
				  <a id="navMypage" class="dropdown-item  " href="${root}/confirmPassword" style="font-size:15px">My Page</a>
					<c:if test = "${userinfo.state eq 1}">
					  <a id="navAdmin" class="dropdown-item  " href="${root }/user/list" style="font-size:15px">Admin</a>
					</c:if>
				  <a id="navLogout" class="dropdown-item nav-link navLogout" type="button" onclick="logoutResult()" style="font-size:15px">Logout</a>
			   </c:otherwise>
	       	  </c:choose>
	        </div>
	      </li>
	    </ul>
	    
	    <ul class="navbar-nav my-2 my-sm-0">
	    <c:choose>
		<c:when test="${empty userinfo}">
		  <li class="nav-item">
		    <a id="navLogin" class="nav-link navLogin" type="button" data-toggle="modal" data-target="#loginModal" style="font-size:15px">Login</a>
		  </li>
		  <li class="nav-item">
		    <a id="navSignup" class="nav-link navSignup" type="button" data-toggle="modal" data-target="#signupModal" style="font-size:15px">SignUp</a>
		  </li>
		  </c:when>
		   <c:otherwise>
			  <li class="nav-item">
			  <a id="navMypage" class="nav-link navMypage" style="font-size:15px">🌸${userinfo.username}님 환영합니다.🌸</a>
			  </li>
			  <li class="nav-item">
			    <a id="navMypage" class="nav-link navMypage" type="button" href="${root}/confirmPassword" style="font-size:15px">My Page</a>
			  </li>
			  <c:if test="${userinfo.state eq 1}">
				  <li class="nav-item">
				    <a id="navAdmin" class="nav-link navAdmin" type="button" href="${root}/user/list" style="font-size:15px">Admin</a>
				  </li>
			  </c:if>
			  <li class="nav-item">
			    <a id="navLogout" class="nav-link navLogout" type="button" href="${root}/user/logout" style="font-size:15px">Logout</a>
			  </li>
		  </c:otherwise>
	       	</c:choose>
		</ul>
	  </div>
	  
	</nav>
	
    <div class="jumbotron text-center" style="margin-bottom:0; margin-top:100px" id="maintitle">
  		<h1>🏡 CHOICHOI HOUSE 🏡</h1>
  		<h4>초이초이하우스에서 나만의 집을 초이스해보세요</h4> 
	</div>
    