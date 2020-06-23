<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<meta name="description" content="#">
<meta name="author" content="#">

<title>My Profile</title>

<!-- Mobile Specific Meta-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="static/static/images/favicon.png" />

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
						<h1 class="page-name">Dashboard</h1>
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li class="active">My Profile</li>
						</ol>

					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="user-dashboard page-wrapper" >
		<div class="container">
				<div class="row">
					<div class="col-md-9">
						<h3>${msg}
							${success} ${user_account.fname}! <span class="text-danger">${error}</span>
							<br>

						</h3>
						<div class="tabCommon mt-20">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#info"
									aria-expanded="false">My Contact Info</a></li>
								<li><a data-toggle="tab" href="#details"
									aria-expanded="true">Update Address</a></li>
								<!-- <li><a href="#cards" data-toggle="tab"> Credit Card</a></li> -->
								
								<li><a data-toggle="tab" href="#company"
									aria-expanded="true">Update Company</a></li>
							</ul>

						</div>

						<div class="tab-content patternbg">
							<div id="details" class="tab-pane fade">
								<div class="container">
									<div class="row">
										<div class="col-md-6">
											<div class="block text-center">

												<form:form action="updatecontact"
													modelAttribute="contact_info" method="post"
													class="text-left clearfix">
													<form:input class="form-control sm" type="hidden" path="id"
														value="${user_account.id}" />
													<div class="form-group">
														<form:input class="form-control" path="phone"
															placeholder="Enter phone" />
													</div>
													<div class="form-group">
														<form:input class="form-control" path="street"
															placeholder="Enter Address" />
													</div>
													<div class="form-group">
														<form:input class="form-control" path="city"
															placeholder="Enter City" />
													</div>
													<div class="form-group">
														<form:input class="form-control" path="zip"
															placeholder="Enter ZIP" />
													</div>
													<div class="form-group">
														<form:select class="form-control" path="state" id="state"
															required="true">

															<c:choose>
																<c:when
																	test="${empty user_account.getContactinfo().state}">
																	<option value="">Select State</option>
																</c:when>
																<c:otherwise>
																	<option value="${user_account.getContactinfo().state}">
																		${user_account.getContactinfo().state}</option>
																</c:otherwise>
															</c:choose>
															<c:forEach items="${states}" var="state">
																<option value="${state}">${state.id}</option>
															</c:forEach>


														</form:select>
													</div>
													<div class="text-left">
														<button type="submit"
															class="btn btn-main btn-small btn-round">Submit</button>
													</div>
												</form:form>

											</div>
										</div>
									</div>
								</div>

							</div>
							<div id="info" class="tab-pane fade active in">
								<div class="dashboard-wrapper dashboard-user-profile">
									<div class="media">
										<div class="pull-left text-center">
											<c:if test="${not empty user_account.image}">
												<img class="media-object user-img"
													src="static/images/users/${user_account.id}/profile/${user_account.image}"
													style="width: 150px; height: 150px;" alt="Image">

											</c:if>
										</div>
										
										<div class="media-body">
										
											<ul class="user-profile-list">
									
												<li><span>Full Name:</span><i
													class="tf-ion-android-person"></i> ${user_account.fname}
													${user_account.lname}</li>
												<li><span>Address:</span><i class="tf-ion-ios-home"></i>
													${user_account.getContactinfo().city}
													${user_account.getContactinfo().state}
													${user_account.getContactinfo().zip}</li>
												<li><span>Email:</span><i class="tf-ion-android-mail"></i>
													${user_account.email}</li>
												<li><b>Phones: </b>
													${user_account.getContactinfo().phone} <a href="#"
													data-toggle="modal" data-target="#addtel"
													class="btn btn-link" title="Add new ppone numbers"><i
														class="tf-ion-ios-plus"></i> </a> <i
													class="tf-ion-android-phone-portrait"></i></li>		
												<c:if test="${role eq 'DBA'}">
												<li><span>Company:</span><i class="tf-ion-android-folder"></i>
												${user_account.getCompany().compName}</li>
												</c:if>									
											</ul>					
										</div>
										
									</div>
								</div>

							</div>

							<div id="cards" class="tab-pane fade">
								<p class="text-left">
									<a href="#" data-toggle="modal" data-target="#addnew"
										class="btn btn-default">Add New Card</a>
								</p>
								<c:if test="${not empty user_account.getPaymentMethod()}">
									<table class="table ">
										<tr class="text-success">
											<th>#</th>
											<th>Card Number</th>
											<th>expiry</th>
											<th>Type</th>
										</tr>
										<tbody>

											<c:set var="count" value="0" />
											<c:forEach var="cards"
												items="${user_account.getPaymentMethod()}">
												<c:set var="count" value="${count+1}" />
												<tr>
													<td>${count}.</td>
													<td>${cards.cardno}</td>
													<td>${cards.expiry}</td>
													<td>Visa <a href="deletecard?id=${cards.id}"
														onclick="confirmed(); return false;"
														class="btn btn-default"> <i class="tf-ion-close"></i></a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
							</div>


						</div>


					</div>
					<div class="col-sm-3 col-xs-12"
						class="d-flex justify-content-center">
						<h3 class="text-dark">${user_account.fname}
							${user_account.lname}</h3>


						<div class="pull-left text-center">
							<c:if test="${not empty user_account.image}">
								<img class="media-object user-img"
									src="static/images/users/${user_account.id}/profile/${user_account.image}"
									style="width: 200px; height: 200px;" alt="Image">
							</c:if>
							<a href="#" data-toggle="modal" data-target="#add-images"
								class="btn btn-transparent mt-20"> <c:choose>
									<c:when test="${not empty user_account.image}">
Change Image
</c:when>
									<c:otherwise>
Add Photo
</c:otherwise>
								</c:choose>
							</a>

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
						<li><a href="#"> <i class="tf-ion-social-facebook"></i>
						</a></li>
						<li><a href="#"> <i class="tf-ion-social-instagram"></i>
						</a></li>
						<li><a href="#"> <i class="tf-ion-social-twitter"></i>
						</a></li>
						<li><a href="#"> <i class="tf-ion-social-pinterest"></i>
						</a></li>
					</ul>
					<ul class="footer-menu">
						<li><a href="#">CONTACT</a></li>
						<li><a href="#">SHIPPING</a></li>
						<li><a href="#">TERMS OF SERVICE</a></li>
						<li><a href="#">PRIVACY POLICY</a></li>
					</ul> -->
					<p class="copyright-text">Powered by Bootstrap</p>
				</div>
			</div>
		</div>
	</footer>

	<div class="modal fade" id="add-images">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<form method="POST" action="addimages"
						enctype="multipart/form-data">
						<h4>Add Image</h4>
						<img id="output_image" class="col-md-12" />
						<div class="control-group">
							<div class="controls">
								<input type="file" name="file" class="form-control"
									onchange="preview_image(event)"> <input type="hidden"
									name="id" value="${user_account.id}">
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

	<div class="modal fade" id="addnew">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<h4>Add New Card</h4>
					<form action="addcard" method="post" role="form"
						class="contactForm">
						<div class="form-group">
							<input type="hidden" name="id" value="${user_account.id}" />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="cardno"
								placeholder="Card Number" min="14" />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="secode"
								placeholder="Card Security" min="3" />
						</div>
						<div class="form-group">
							<input type="month" class="form-control" name="expiry"
								placeholder="Expiry Date" />
						</div>
						<button class="btn btn-main btn-small btn-round" type="submit">Add
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</form>

				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="addtel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">

					<form action="addphone" method="post" role="form"
						class="contactForm">
						<h4>Add Telephone Number</h4>
						<input type="hidden" name="id" value="${user_account.id}">
						<div class="form-group">
							<input type="text" name="tel" class="form-control"
								placeholder="Phone Number">
						</div>
						<div class="form-group">
							<select name="type" class="form-control">
								<option value="Select">Select Type</option>
								<option value="Mobile">Mobile</option>
								<option value="Home">Home</option>
								<option value="Work">Work</option>
							</select>
						</div>
						<div class="text-left">
							<button class="btn btn-main btn-small btn-round" type="submit">Add
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>

						</div>

					</form>

				</div>
			</div>

		</div>
	</div>


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

	<script type="text/javascript">
     function preview_image(event) 
     {
      var reader = new FileReader();
      reader.onload = function()
      {
       var output = document.getElementById('output_image');
       output.classList.add("preview");
       output.src = reader.result;
      }
      reader.readAsDataURL(event.target.files[0]);
     }

    function confirmed(){
            if (confirm('You are about to delete, Do you want to proceed?')) {
                  document.getElementById("del").submit();
                  return true;
            } else {
               return false;
            }
         }
            
    $("#searchnow").keyup(function () {
        var value = this.value.toLowerCase().trim();

        $("table tr").each(function (index) {
            if (!index) return;
            $(this).find("td").each(function () {
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