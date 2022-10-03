<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en">

<head>
<meta charset="utf-8">
<title>중고 물품 게시판</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resource/lib/animate/animate.min.css" rel="stylesheet">
<link href="resource/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resource/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resource/dist/css/style.css" rel="stylesheet">
<!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="51">
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-grow text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- Navbar & Hero Start -->
		<div class="container-xxl position-relative p-0" id="home">
			<!-- <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="/Project" class="navbar-brand p-0">
                    <h1 class="m-0">중고 마켓</h1>
                    <img src="img/logo.png" alt="Logo">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav mx-auto py-0">
                        <a href="#home" class="nav-item nav-link active">메인</a>
                        <a href="#about" class="nav-item nav-link">거래소</a>
                        <a href="#feature" class="nav-item nav-link">FnA</a>
                        <a href="#pricing" class="nav-item nav-link">???</a>
                        <a href="#review" class="nav-item nav-link">????</a>
                        <a href="#contact" class="nav-item nav-link">????</a>
                    </div>
                    <a href="" class="btn btn-primary-gradient rounded-pill py-2 px-4 ms-3 d-none d-lg-block">내가 등록한 글</a>
                </div>
            </nav> --><jsp:include page="../header.jsp"></jsp:include>

			<div class="container-xxl bg-primary hero-header">
				<div class="container px-lg-5">
					<div class="row g-5">
						<div class="col-lg-8 text-center text-lg-start">
							<!-- <h2 class="text-white mb-4 animated slideInDown">본인이 필요없는 물건을 팔아보세요.</h2> -->

							<c:if test="${SessionMemberId eq null}">
								<a href="login.do"
									class="btn btn-primary-gradient py-sm-3 px-4 px-sm-5 rounded-pill me-3 animated slideInLeft">로그인
									하고 물픔등록하기</a>
							</c:if>
							<!-- <a href="" class="btn btn-secondary-gradient py-sm-3 px-4 px-sm-5 rounded-pill animated slideInRight">Contact Us</a> -->

							<div id="mainHide"></div>
						</div>
						<%--  <table class="table table-dark table-striped">
			<thead>
				<tr>
					<th scope="col" width="50">상품</th>
					<th scope="col" width="100">지역</th>
					<th scope="col" width="100">제목</th>
					<th scope="col" width="100">작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<c:set var="title" value="${board.title}"/>
					<c:set var="titleView" value="${fn:substring(title,0,12)}"/>
					
					<tr>
						<td><c:set var="image" value="${board.picturePath}"/>     
         				<c:if test="${fn:contains(image, '.')}">
         				<div style="display:flex; justify-content:left; align-items:left;">         	
        				<img src ="/IMAGES/${board.picturePath}" width="150px", height="150px"/>
       					</div>
       					</c:if>
       					</td>
						<td>${board.boardType}</td>
						<td><a class="text-warning" href="view.do?boardNo=${board.boardNo}">
						<c:choose>
							<c:when test="${titleView.length()<12}">
								${titleView}
							</c:when>
							<c:otherwise>
								${titleView}...
							</c:otherwise>
						</c:choose>
						</a>
						</td>
						<td>${board.memberNickname}</td>
					</tr>
				</c:forEach>

			</tbody>
			
		</table>     --%>




					</div>
				</div>
			</div>
		</div>


		<!-- Navbar & Hero End -->


		<!-- About Start -->
		<div class="container-xxl py-5" id="about">
			<div class="container py-5 px-lg-5">
				<div class="row g-5 align-items-center">
					<div class="wow fadeInUp" data-wow-delay="0.1s">

						<h1 class="text-primary-gradient fw-medium" align="center">
							<i
								class="fa fa-cogs fa-2x text-primary-gradient flex-shrink-0 mt-1"></i>중고거래
							게시판<i
								class="fa fa-cogs fa-2x text-primary-gradient flex-shrink-0 mt-1"></i>
						</h1>
						<br> <br> <br>
						<div align="center">

							<c:forEach items="${boardList}" var="board">
								<c:set var="title" value="${board.title}" />
								<c:set var="titleView" value="${fn:substring(title,0,12)}" />
								<div
									style="display: inline-flex; flex-direction: column; justify-content: flex-start; align-items: center;">
									<c:if test="${SessionMemberId eq board.memberId}">


									<c:set var="image" value="${board.picturePath}" />
									<c:if test="${fn:contains(image, '.')}">
										<div
											style="display: flex; justify-content: left; align-items: left;">
											<img src="/IMAGES/${board.picturePath}" width="230px"
												, height="230px" />
										</div>
									</c:if>
									<%-- <img src="${pageContext.request.contextPath}/resource/img/${room.picturePath}" class="img-thumbnail" style="width:300px; height:300; "> --%>
									<a class="text-warning" href="view.do?boardNo=${board.boardNo}">
										<%-- <a href="#" onclick="goGet('roominformationview.do','GET', ${room.roomNo}); return false;"> --%>

										<div
											style="display: inline-flex; justify-content: flex-start; align-items: center;">
											
											<table class="table table-striped table-hover">
												<tr>
													<th>지역</th>
													<td align="center">${board.boardType}</td>
												</tr>
												<tr>
													<th>상품 이름</th>
													<td>${board.title}</td>
												</tr>
												<tr>
													<th>가격</th>
													<td align="center">${board.price}</td>
												</tr>
											</table>
											
										</div>
										
									</a>
									</c:if>
								</div>
							</c:forEach>
							

						</div>
						<div >
							<nav aria-label="Page navigation example"
								style="text-align: center;">
								<div style="display: inline-flex; flex-direction: column; justify-content: flex-start; align-items: center;">
									<ul class="pagination">
										<c:if test="${firstPage > pageList}">
											<li class="page-item"><a class="page-link"
												href="boardList.do?viewPage=${firstPage - pageList}">이전</a></li>
										</c:if>
										<c:forEach var="i" begin="${firstPage}" end="${lastPage}">
											<li class="page-item"><a class="page-link"
												href="boardList.do?viewPage=${i}">${i}</a></li>
										</c:forEach>
										<c:if test="${lastPage < totalPage}">
											<li class="page-item"><a class="page-link"
												href="boardList.do?viewPage=${firstPage + pageList}">다음</a></li>
										</c:if>
									</ul>
								</div>
							</nav>
						</div>
						<br> <br> <br> <br>
						<c:if test="${SessionMemberId ne null}">
							<a href="insert.do"
								class="btn btn-primary-gradient py-sm-3 px-4 px-sm-5 rounded-pill me-3 animated slideInLeft"
								style="margin-left: 500px;">물품 등록</a>
						</c:if>
					</div>


					<!--  <!-- <p class="mb-4">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore. Clita erat ipsum et lorem et sit, sed stet no labore lorem sit clita duo justo eirmod magna dolore erat amet</p> -->
					<!-- <div class="row g-4 mb-4">
						<div class="col-sm-6 wow fadeIn" data-wow-delay="0.5s">
							<div class="d-flex">
								<i
									class="fa fa-cogs fa-2x text-primary-gradient flex-shrink-0 mt-1"></i>
								<div class="ms-3">
									<h2 class="mb-0" data-toggle="counter-up">1234</h2>
									<p class="text-primary-gradient mb-0">Active Install</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6 wow fadeIn" data-wow-delay="0.7s">
							<div class="d-flex">
								<i
									class="fa fa-comments fa-2x text-secondary-gradient flex-shrink-0 mt-1"></i>
								<div class="ms-3">
									<h2 class="mb-0" data-toggle="counter-up">1234</h2>
									<p class="text-secondary-gradient mb-0">Clients Reviews</p>
								</div>
							</div>
						</div>
					</div> -->




				</div>

			</div>

		</div>
	</div>

	<!-- About End -->


	<!-- Features Start -->

	<!-- Features End -->


	<!-- Screenshot Start -->

	<!-- Screenshot End -->


	<!-- Process Start -->

	<!-- Process Start -->


	<!-- Download Start -->

	<!-- Download End -->


	<!-- Pricing Start -->

	<!-- Pricing End -->


	<!-- Testimonial Start -->

	<!-- Testimonial End -->


	<!-- Contact Start -->

	<!-- Contact End -->


	<!-- Footer Start -->
	<div class="container-fluid bg-primary text-light footer wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5 px-lg-5">
			<div class="row g-5">
				<div class="col-md-6 col-lg-3">
					<h4 class="text-white mb-4">Address</h4>
					<p>
						<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA
					</p>
					<p>
						<i class="fa fa-phone-alt me-3"></i>+012 345 67890
					</p>
					<p>
						<i class="fa fa-envelope me-3"></i>info@example.com
					</p>
					<div class="d-flex pt-2">
						<a class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-instagram"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<h4 class="text-white mb-4">Quick Link</h4>
					<a class="btn btn-link" href="">About Us</a> <a
						class="btn btn-link" href="">Contact Us</a> <a
						class="btn btn-link" href="">Privacy Policy</a> <a
						class="btn btn-link" href="">Terms & Condition</a> <a
						class="btn btn-link" href="">Career</a>
				</div>
				<div class="col-md-6 col-lg-3">
					<h4 class="text-white mb-4">Popular Link</h4>
					<a class="btn btn-link" href="">About Us</a> <a
						class="btn btn-link" href="">Contact Us</a> <a
						class="btn btn-link" href="">Privacy Policy</a> <a
						class="btn btn-link" href="">Terms & Condition</a> <a
						class="btn btn-link" href="">Career</a>
				</div>
				<div class="col-md-6 col-lg-3">
					<h4 class="text-white mb-4">Newsletter</h4>
					<p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi.
						Curabitur facilisis ornare velit non vulpu</p>
					<div class="position-relative w-100 mt-3">
						<input class="form-control border-0 rounded-pill w-100 ps-4 pe-5"
							type="text" placeholder="Your Email" style="height: 48px;">
						<button type="button"
							class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2">
							<i class="fa fa-paper-plane text-primary-gradient fs-4"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container px-lg-5">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Your Site Name</a>, All
						Right Reserved.

						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
							Codex</a> </br> Distributed By <a class="border-bottom"
							href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</div>
					<div class="col-md-6 text-center text-md-end">
						<div class="footer-menu">
							<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> <a
								href="">FQAs</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-lg-square back-to-top pt-2"><i
		class="bi bi-arrow-up text-white"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="resource/lib/wow/wow.min.js"></script>
	<script src="resource/lib/easing/easing.min.js"></script>
	<script src="resource/lib/waypoints/waypoints.min.js"></script>
	<script src="resource/lib/counterup/counterup.min.js"></script>
	<script src="resource/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="resource/dist/js/main.js"></script>
</body>

</html>