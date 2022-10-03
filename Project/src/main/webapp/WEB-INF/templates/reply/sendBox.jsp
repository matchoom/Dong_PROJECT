<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport"
	content="width=device-width, initial-scale=1">

<style>
.btn:hover {
	color: white;
}

#wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.lab {
	display: flex;
}

html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
}

.a {
	min-height: 100%;
}
</style>

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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function loginMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		$.ajax({
			url : 'loginMember.do',
			type : 'POST',
			data : {
				memberId : id,
				memberPassword : pw
			},
			datatype : 'JSON',
			success : function(data) {
				if(data == 1){
				location.href = "main.do"
				}
				else{
					alert("아이디 또는 비밀번호를 확인해 주세요");
				}
			}
		})
	}
</script>
<title>로그인</title>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="51">

<div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
         <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div> 
	<div class="container-xxl position-relative p-0" id="home">
		<jsp:include page="../header.jsp"></jsp:include>

		<div class="container-xxl bg-primary hero-header">
			<div class="container px-lg-5">
				<div class="row g-5">
					<div class="col-lg-8 text-center text-lg-start">
						<!-- <a href="" class="btn btn-secondary-gradient py-sm-3 px-4 px-sm-5 rounded-pill animated slideInRight">Contact Us</a> -->

						<div id="mainHide"></div>

					</div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌ -->
	
	<div class="container-xxl py-5" id="about">
            <div class="container py-5 px-lg-5">
							<div class="container" style="display:inline-flex;>
							
							<div class="form-group" >
								<div class="form-group">
								  <h1 class="text-primary-gradient fw-medium">쪽지함</h1>
									<div class="form-group">
										<div id="mainHide">
											<table class="table table-striped table-hover" >
												<thead>
													<tr>
														<th scope="col" width="700">닉네임</th>
														<th scope="col" width="700">제목</th>
														<th scope="col" width="700">보낸 날짜</th>
														<th scope="col" width="700"></th>		
													</tr>
												</thead>
												<tbody>
													<c:forEach var="reply" items="${replyList}">
														<c:set var="title" value="${reply.title}"/>
														<c:set var="titleView" value="${fn:substring(title,0,12) }"/>
														
														<c:if test="${SessionMemberId eq reply.targetId}">
														<tr>
															<td>${reply.memberNickname}</td>
															<td>
															<c:choose>
																<c:when test="${titleView.length()<12}">
																	${titleView}
																</c:when>
																<c:otherwise>
																	${titleView}...
																</c:otherwise>
															</c:choose>
															</td>
															<td><fmt:formatDate value="${reply.wdate}" pattern="yyyy-MM-dd HH:mm"/></td>
															<td>
															<button style="width:90px;"class="btn btn-info" onclick="window.open('http://localhost:8080/Project/sendView.do?replyNo=${reply.replyNo}','Comment', 'width=600,height=600')">쪽지보기</button>
															
															</td>
														</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
										
										
										
								
									</div>				
								</div>
							</div>
							
							</div>
				
           
            </div>
        </div>
        
        
        <!-- ㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌ -->


        
        

        <!-- Footer Start -->
        <div class="container-fluid bg-primary text-light footer wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5 px-lg-5">
                <div class="row g-5">
                    <div class="col-md-6 col-lg-3">
                        <h4 class="text-white mb-4">Address</h4>
                        <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <h4 class="text-white mb-4">Quick Link</h4>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                        <a class="btn btn-link" href="">Career</a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <h4 class="text-white mb-4">Popular Link</h4>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                        <a class="btn btn-link" href="">Career</a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <h4 class="text-white mb-4">Newsletter</h4>
                        <p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulpu</p>
                        <div class="position-relative w-100 mt-3">
                            <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5" type="text" placeholder="Your Email" style="height: 48px;">
                            <button type="button" class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2"><i class="fa fa-paper-plane text-primary-gradient fs-4"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container px-lg-5">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                            </br>
                            Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up text-white"></i></a>
	
	
	
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