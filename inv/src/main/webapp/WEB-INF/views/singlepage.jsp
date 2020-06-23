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
<meta http-equiv="refresh"
	CONTENT="<%= session.getMaxInactiveInterval() %>; URL='${contextPath}/expired'" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description">
<!-- content="Aviato E-Commerce Template" -->

<meta name="author">
<!-- content="Themefisher.com" -->

<title>${company_account.compName}</title>

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

<link rel="stylesheet" id="bootstrap-css" href="static/css/search.css">



<!------ Include the above in your HEAD tag ---------->

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
						<h1 class="page-name">${company_account.compName}</h1>
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li class="active">${company_account.compName}</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="single-product">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<ol class="breadcrumb">
						<li><a href="home">Home</a></li>
						<li><a href="search">Search</a></li>
						<li class="active">${company_account.compName}</li>
					</ol>
				</div>
			</div>
			<div class="row mt-20">
				<div class="col-md-5">
					<div class="single-product-slider">
						<div id='carousel-custom' class='carousel slide'
							data-ride='carousel'>
							<div class='carousel-outer'>
								<c:if test="${not empty company_account.compImage}">
									<img class="media-object comp-img"
										src="static/images/company/${company_account.companyId}/compProfile/${company_account.compImage}"
										style="width: 250px; height: 250px;" alt="Image">
								</c:if>
								<a href="#" data-toggle="modal" data-target="#add-comp-images"
									class="btn btn-transparent mt-20"> <c:if
										test="${role eq 'DBA' or 'ADMIN'}">
										<c:choose>
											<c:when test="${not empty company_account.compImage}">
										Change Image
								</c:when>
											<c:otherwise>
												<img src="static/images/noimage.jpg" />
												<br>Add Photo
							</c:otherwise>
										</c:choose>
									</c:if>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<div class="single-product-details">
						<h2>${company_account.compName}</h2>
						<p class="product-description mt-20">${company_account.compDescription}</p>
						<a href="${company_account.compUrl}" class="btn btn-main mt-20">Company
							Website</a> <a href="${company_account.compDonate}"
							class="btn btn-main mt-20">Donate</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="tabCommon mt-20">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#details"
								aria-expanded="true">Details</a></li>
							<li class=""><a data-toggle="tab" href="#reviews"
								aria-expanded="false">Reviews</a></li>
						</ul>
						<div class="tab-content patternbg">
							<div id="details" class="tab-pane fade active in">
								<h4>${company_account.compName}</h4>
								<p>${company_account.compStreet}
									<br>${company_account.compCity},
									${company_account.compState} ${company_account.compZip}
								</p>
								<ol>
									<li><b>COVID-19 STATUS:</b> ${company_account.compStatus}</li>
									<%-- <li><a href="#" data-toggle="modal" data-target="#update"
										title="Receive Update">Receive Future COVID-19 Updates?</a><br>${msg}</li> --%>

									<li><br> <b>Seating Capacity:</b>
										${company_account.compSeating}</li>

									<li><b>Current Performance:</b>
										${company_account.compCurrentshow}</li>

									<li><b>Price Range:</b>
										${company_account.compTicketlow}-${company_account.compTickethigh}</li>
								</ol>

								<div class="modal fade" id="update">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<!-- Modal body -->
											<div class="modal-body">
												<section class="forget-password-page account">
													<div class="container">
														<div class="row col-md-6">
															<h2 class="text-center">Confirm Email</h2>
															<form action="setUpdateEmail" method="post"
																class="text-left clearfix">
																<c:choose>
																<c:when test="${role eq null}">
																<p>Login to receive updates</p>
																</c:when>
																<c:otherwise>
																<div class="form-group">
																	<input type="email" name="email" class="form-control"
																		value="${user_account.email}"
																		>
																</div>
																<div class="text-left">
																	<button type="submit" class="btn btn-main text-center">Submit</button>
																	<button type="button"
																		class="btn btn-main btn-medium btn-danger"
																		data-dismiss="modal">Close</button>
																</div>
																</c:otherwise>
																</c:choose>
															</form>

														</div>

													</div>
												</section>

											</div>
										</div>

									</div>
								</div>

							</div>
							<div id="reviews" class="tab-pane fade">
								<div class="post-comments">
									<ul class="media-list comments-list m-bot-50 clearlist">
										<!-- Comment Item start-->
										<li class="media"><a class="pull-left" href="#"> <img
												class="media-object comment-avatar"
												src="images/blog/avater-1.jpg" alt="" width="50" height="50" /></a>
											<c:forEach var="review" items="${company_account.review}">
												<div class="media-body">
													<div class="comment-info">
														<h5 class="comment-author">${review.user.fname}
															${review.user.lname}</h5>
														<time datetime="2013-04-06T13:53"> ${review.myDate}</time>
													</div>
													<p>${review.text}</p>
												</div>
												<br>
											</c:forEach></li>
									</ul>
									<!-- End Comment Item -->

									<div class="media">
										<a class="pull-left" href="#"> <img
											class="media-object comment-avatar"
											src="images/blog/avater-1.jpg" alt="" width="50" height="50" />
										</a>
										<div class="media-body">
											<div class="comment-info">
												<div class="well well-sm">
													<div class="text-right">
														<a class="btn btn-main mt-20" href="#reviews-anchor"
															id="open-review-box">Leave a Review</a>
													</div>
													<c:choose>
														<c:when test="${empty loggedInuser}">
															<div class="row" id="post-review-box"
																style="display: none;">
																<div class="col-md-12">
																	<a class="btn btn-main mt-20" href="login">Login to
																		leave a review</a>
																</div>
															</div>
														</c:when>
														<c:otherwise>
															<div class="row" id="post-review-box"
																style="display: none;">
																<div class="col-md-12">

																	<form:form accept-charset="UTF-8" action="addReview"
																		method="post" modelAttribute="reviews">
																		<div class="form-group">
																			<input class="form-control animated" cols="50"
																				id="text" name="text"
																				placeholder="Enter your review here..." rows="5" />
																		</div>
																		<div class="form-group">
																			<input type="hidden"
																				id="email" name="email"
																				placeholder="${loggedInuser}"/>
																		</div>
																		<div class="form-group">
																			<input type="hidden" id="companyId" name="companyId" value="${company_account.companyId}"/>
																		</div>
																		<%-- <div class="form-group">
																			<input type="hidden" id="lname" name="lname" value="${user_account.lname}"/>
																		</div> --%>
																		<div class="text-right">
																			<a class="btn btn-danger mt-20" href="#"
																				id="close-review-box"
																				style="display: none; margin-right: 10px;">
																				Cancel </a>
																			<button class="btn btn-main mt-20" type="submit">Save</button>
																		</div>
																	</form:form>

																</div>
															</div>
														</c:otherwise>
													</c:choose>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="footer section text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- <ul class="social-media">
						<li><a href=""> <i class="tf-ion-social-facebook"></i>
						</a></li>
						<li><a href=""> <i class="tf-ion-social-instagram"></i>
						</a></li>
						<li><a href=""> <i class="tf-ion-social-twitter"></i>
						</a></li>
						<li><a href=""> <i class="tf-ion-social-pinterest"></i>
						</a></li>
					</ul>
					<ul class="footer-menu">
						<li><a href="">CONTACT</a></li>
						<li><a href="">SHIPPING</a></li>
						<li><a href="">TERMS OF SERVICE</a></li>
						<li><a href="">PRIVACY POLICY</a></li>
					</ul> -->
					<p class="copyright-text">Powered by Bootstrap</p>
				</div>
			</div>
		</div>
	</footer>

	<div class="modal fade" id="add-comp-images">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<form method="POST" action="addcompimages"
						enctype="multipart/form-data">
						<h4>Add Image</h4>
						<img id="output_image" class="col-md-12" />
						<div class="control-group">
							<div class="controls">
								<input type="file" name="file" class="form-control"
									onchange="preview_image(event)"> <input type="hidden"
									name="id" value="${company_account.companyId}">
							</div>
						</div>
						<div class="control-group">
							<br>
							<div class="controls">
								<button type="submit" class="btn btn-default">Upload</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script src="static/plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="static/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<!-- Instagram Feed Js -->
	<script src="static/plugins/instafeed-js/instafeed.min.js"></script>
	<!-- Video Lightbox Plugin -->
	<script src="static/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
	<!-- Count Down Js -->
	<script src="static/plugins/SyoTimer/build/jquery.syotimer.min.js"></script>

	<!-- Revolution Slider -->
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/jquery.themepunch.revolution.min.js"></script>

	<!-- Revolution Slider -->
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/assets/warning.js"></script>



	<!-- Google Mapl -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="static/plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="static/js/script.js"></script>

	<!-- <script
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script> -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<script src="static/js/autosizejs.js"></script>

	<script type="text/javascript">
		//can't change/add photo
		function preview_image(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('output_image');
				output.classList.add("preview");
				output.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
		}

		function confirmed() {
			if (confirm('You are about to delete, Do you want to proceed?')) {
				document.getElementById("del").submit();
				return true;
			} else {
				return false;
			}
		}

		$("#searchnow").keyup(function() {
			var value = this.value.toLowerCase().trim();

			$("table tr").each(function(index) {
				if (!index)
					return;
				$(this).find("td").each(function() {
					var id = $(this).text().toLowerCase().trim();
					var not_found = (id.indexOf(value) == -1);
					$(this).closest('tr').toggle(!not_found);
					return not_found;
				});
			});
		});
	</script>

</body>
</html>