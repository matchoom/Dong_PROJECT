<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sns.members.service.MembersVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String memberId = (String) session.getAttribute("SessionMemberId");
   String memberNickname = (String) session.getAttribute("SessionMemberNickname");
   
   MembersVO sessionMember = (MembersVO) session.getAttribute("SessionMember");
%>
<nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="/Project" class="navbar-brand p-0">
                    <h1 class="m-0">오이 마켓</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav mx-auto py-0">
                        <a href="main.do" class="nav-item nav-link active">메인</a>
                        <c:if test="${SessionMemberId ne null}">
                        <a href="sendBox.do" class="nav-item nav-link">쪽지함</a>
                        </c:if>
                        <c:if test="${SessionMemberId ne null}">
                        <a href="myBoard.do" class="nav-item nav-link">내 거래글</a>
                        </c:if>
                        <c:if test="${SessionMemberId eq null}">
                        <a href="sign.do" class="nav-item nav-link">회원가입</a>
                        </c:if>
                        <c:if test="${SessionMemberId ne null}">
                        
                        <a href="logout.do" class="nav-item nav-link">로그아웃</a>
                        <h4 class="nav-item nav-link" style="margin-left:100px;">${SessionMemberId}님, 환영합니다.</h4>
                        </c:if>
                        
                    </div>
                </div>
            </nav>
</body>
</html>