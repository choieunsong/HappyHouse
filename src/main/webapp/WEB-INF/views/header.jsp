<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header>
	<nav class="navbar navbar-expand-sm navbar-light bg-light">
	  <!-- Brand/logo -->
	  <a class="navbar-brand" href="${root}">
		<img src="${root}/img/logo.png" alt="logo" style="width:80px;">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarColor01">
	    <ul class="navbar-nav mr-auto">
	    <c:if test = "${userinfo != null}">
	      <li class="nav-item">
	        <a class="nav-link" href="${root}/tradingInformation">거래정보 검색</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${root }/favorite">관심지역 정보</a>
	      </li>
	      </c:if>
	      <li class="nav-item">
	        <a class="nav-link" href="#" onclick="myRegion()">공지사항</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${root}/qna">자유게시판</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">사이트맵</a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="${root }/tradingIngormation">거래정보 검색</a>
	          <a class="dropdown-item" href="${root}/favorite">관심지역 정보</a>
	          <a class="dropdown-item" href="#" onclick="myRegion()">공지사항</a>
	          <a class="dropdown-item" href="${root}/qna">자유게시판</a>
	          <div class="dropdown-divider"></div>
	          
	       	 <!-- 로그인 안했을 때 보여야 할 부분  &로그인 했을 때 보여야할 부분 //style="display:block;"-->
	          <c:choose>
			      <c:when test="${empty userinfo}">
				  	<a id="navLogin" class="dropdown-item nav-link navLogin" type="button" data-toggle="modal" data-target="#loginModal">Login</a>
				    <a id="navSignup" class="dropdown-item nav-link navSignup" type="button" data-toggle="modal" data-target="#signupModal">SignUp</a>
			     </c:when>
			      <c:otherwise>
				    <a id="navMypage" class="dropdown-item nav-link navMypage" type="button" href="${root}/confirmPassword">My Page</a>
				    <%-- <c:if test = "${userinfo.state eq 1}"> --%>
				    	<a id="navAdmin" class="dropdown-item nav-link navAdmin" type="button"  href="${root }/user/list">Admin</a>
				    <%-- </c:if> --%>
				    <a id="navLogout" class="dropdown-item nav-link navLogout" type="button" onclick="logoutResult()">Logout</a>
		      	</c:otherwise>
	       	</c:choose>
	       	
	        </div>
	      </li>
	    </ul>
	    
	    <ul class="navbar-nav my-2 my-sm-0">
	    <c:choose>
		<c:when test="${empty userinfo}">
		  <li class="nav-item">
		    <a id="navLogin" class="nav-link navLogin" type="button" data-toggle="modal" data-target="#loginModal">Login</a>
		  </li>
		  <li class="nav-item">
		    <a id="navSignup" class="nav-link navSignup" type="button" data-toggle="modal" data-target="#signupModal">SignUp</a>
		  </li>
		  </c:when>
		   <c:otherwise>
			  <li class="nav-item">
			  <a id="navMypage" class="nav-link navMypage">${userinfo.username}님 환영합니다.</a>
			  </li>
			  <li class="nav-item">
			    <a id="navMypage" class="nav-link navMypage" type="button" href="${root}/confirmPassword">My Page</a>
			  </li>
			  <c:if test="${userinfo.state eq 1}">
				  <li class="nav-item">
				    <a id="navAdmin" class="nav-link navAdmin" type="button" href="${root}/user/list">Admin</a>
				  </li>
			  </c:if>
			  <li class="nav-item">
			    <a id="navLogout" class="nav-link navLogout" type="button" href="${root}/user/logout">Logout</a>
			  </li>
		  </c:otherwise>
	       	</c:choose>
		</ul>
	  </div>
	</nav>
    </header>
    
    