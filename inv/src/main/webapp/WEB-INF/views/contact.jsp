<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="#">
<meta name="author" content="#">

<title>Contact</title>

<!-- Mobile Specific Meta-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="static/images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet" href="static/plugins/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="static/plugins/bootstrap/css/bootstrap.min.css">

<!-- Revolution Slider -->
<link rel="stylesheet" type="text/css"
	href="static/plugins/revolution-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
<link rel="stylesheet" type="text/css"
	href="static/plugins/revolution-slider/revolution/fonts/font-awesome/css/font-awesome.css">

<!-- REVOLUTION STYLE SHEETS -->
<link rel="stylesheet" type="text/css"
	href="static/plugins/revolution-slider/revolution/css/settings.css">
<link rel="stylesheet" type="text/css"
	href="static/plugins/revolution-slider/revolution/css/layers.css">
<link rel="stylesheet" type="text/css"
	href="static/plugins/revolution-slider/revolution/css/navigation.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="static/css/style.css">

</head>

<body id="body">
	<!-- Start Top Header Bar -->
	<jsp:include page="header.jsp" />

	<!-- Main Menu Section -->

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Contact</h1>
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li class="active">contact</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>




	<section class="page-wrapper">
		<div class="contact-section">
			<div class="container">
				<div class="row">
					<!-- Contact Form -->
					<h3 class="text-left text-dark"> ${msg} me!</h3>
					<h4 class="text-left text-dark"> Phone Number: 805-602-6277</h4>
					<h4 class="text-left text-dark"> Or send an email below:</h4>
					<div class="contact-form col-md-6 ">
						<form action="sendemail" method="post" id="contact-form"
							role="form">
							<div class="form-group">
								<input type="text" placeholder="Your Name" class="form-control"
									name="name" id="name" required>
							</div>

							<div class="form-group">
								<input type="email" placeholder="Your Email"
									class="form-control" name="email" id="email" required>
							</div>

							<div class="form-group">
								<input type="text" placeholder="Subject" class="form-control"
									name="subject" id="subject" required>
							</div>

							<div class="form-group">
								<textarea rows="6" placeholder="Message" class="form-control"
									name="message" id="message" required></textarea>
							</div>
							<div id="cf-submit">
								<input type="submit" id="contact-submit"
									class="btn btn-transparent" value="Submit">
							</div>
						</form>
					</div>
					<!-- ./End Contact Form -->

					<!-- Contact Details -->
					<div class="contact-details col-md-6 ">
						<div class="google-map">
							<!-- <div id="map"></div> -->
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d199411.7393287934!2d-90.38354516841609!3d38.65328504875301!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x87d8b4a9faed8ef9%3A0xbe39eaca22bbe05b!2sSt.%20Louis%2C%20MO!5e0!3m2!1sen!2sus!4v1592328527335!5m2!1sen!2sus" 
							width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
						</div>
						<!-- <ul class="contact-short-info">
							<li><i class="tf-ion-ios-home"></i> <span>Khaja Road,
									Bayzid, Chittagong, Bangladesh</span></li>
							<li><i class="tf-ion-android-phone-portrait"></i> <span>Phone:
									+880-31-000-000</span></li>
							<li><i class="tf-ion-android-globe"></i> <span>Fax:
									+880-31-000-000</span></li>
							<li><i class="tf-ion-android-mail"></i> <span>Email:
									hello@example.com</span></li>
						</ul> -->
						<!-- Footer Social Links -->
						<!-- <div class="social-icon">
							<ul>
								<li><a class="fb-icon" href="#"><i
										class="tf-ion-social-facebook"></i></a></li>
								<li><a href="#"><i class="tf-ion-social-twitter"></i></a></li>
								<li><a href="#"><i
										class="tf-ion-social-dribbble-outline"></i></a></li>
								<li><a href="#"><i
										class="tf-ion-social-googleplus-outline"></i></a></li>
								<li><a href="#"><i
										class="tf-ion-social-pinterest-outline"></i></a></li>
							</ul>
						</div> -->
						<!--/. End Footer Social Links -->
					</div>
					<!-- / End Contact Details -->



				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
	</section>
	<footer class="footer section text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- <ul class="social-media">
						<li><a href="#"> <i class="tf-ion-social-facebook"></i>
						</a></li>
						<li><a href="#"> <i class="tf-ion-social-instagram"></i>
						</a></li>
						<li><a href="#"> <i class="tf-ion-social-twitter"></i>
						</a></li>
						<li><a href="#"> <i class="tf-ion-social-pinterest"></i>
						</a></li>
					</ul> -->
					<!-- <ul class="footer-menu">
						<li><a href="contactus">CONTACT</a></li>
						<li><a href="about">ABOUT US</a></li>
						<li><a href="register">REGISTER</a></li>
					</ul> -->
					<p class="copyright-text">Powered by Bootstrap</p>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>