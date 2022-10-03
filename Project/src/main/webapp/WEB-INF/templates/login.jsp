<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="header.jsp"></jsp:include>

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
							<div class="container" style="display:inline-flex; height:400px">
							
							<div class="form-group" >
								<div class="form-group">
								  <h1 class="text-primary-gradient fw-medium">로그인</h1>
									<div class="form-group" style="width: 300px">
										<label for="memberId" class="lab"><h5 class="text-primary-gradient fw-medium">ID</h5></label> <input
											type="text" id="memberId" class="form-control"
											style="width: 300px" name="memberId" placeholder="아이디 입력해주세요">
									</div>
									<div class="form-group" style="width: 300px">
										<label for="memberPassword" class="lab"><h5 class="text-primary-gradient fw-medium">PassWord</h5></label> <input
											type="password" id="memberPassword" class="form-control"
											style="width: 300px" name="memberPassword"
											placeholder="비밀번호 입력해주세요">
									</div>
									<div class="from-group">
											<a class="btn btn-primary-gradient py-sm-3 px-4 px-sm-5 rounded-pill mt-3" href="javascript:loginMember();">로그인</a>			
											<a class="btn btn-primary-gradient py-sm-3 px-4 px-sm-5 rounded-pill mt-3" href="sign.do">회원가입</a>
											
										<br>
										<br>
								</div>									
								</div>
							</div>
								<div class="row g-5 align-items-center">
	                   				<div class="col-lg-6">
	                       				<img class="img-fluid wow fadeInUp" data-wow-delay="0.5s" src="resource/img/about.png"   style="margin-left:200px; width:910px; height:510px;">
	                    			</div>
               					</div>
							</div>
				
            <!-- 
                <div class="row g-5 align-items-center">
                
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    
                    
                        
                        <p class="mb-4">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore. Clita erat ipsum et lorem et sit, sed stet no labore lorem sit clita duo justo eirmod magna dolore erat amet</p>
                        
						
						
                        <div class="row g-4 mb-4">
                            <div class="col-sm-6 wow fadeIn" data-wow-delay="0.5s">
                                <div claxss="d-flex">
                                    <i class="fa fa-cogs fa-2x text-primary-gradient flex-shrink-0 mt-1"></i>
                                    <div class="ms-3">
                                        <h2 class="mb-0" data-toggle="counter-up">1234</h2>
                                        <p class="text-primary-gradient mb-0">Active Install</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 wow fadeIn" data-wow-delay="0.7s">
                                <div class="d-flex">
                                    <i class="fa fa-comments fa-2x text-secondary-gradient flex-shrink-0 mt-1"></i>
                                    <div class="ms-3">
                                        <h2 class="mb-0" data-toggle="counter-up">1234</h2>
                                        <p class="text-secondary-gradient mb-0">Clients Reviews</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="" class="btn btn-primary-gradient py-sm-3 px-4 px-sm-5 rounded-pill mt-3">Read More</a>
                    </div>
                    <div class="col-lg-6">
                        <img class="img-fluid wow fadeInUp" data-wow-delay="0.5s" src="resource/img/about.png">
                    </div>
                </div> -->
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