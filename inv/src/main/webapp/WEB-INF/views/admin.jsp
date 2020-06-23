<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${role ne 'ADMIN'}">
	<c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="refresh"
	CONTENT="<%= session.getMaxInactiveInterval() %>; URL='${pageContext.request.contextPath}/expired'" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Aviato E-Commerce Template">

<meta name="author" content="#">

<title>Admin</title>

<!-- Mobile Specific Meta-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="static/images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet"
	href="static/plugins/themefisher-font/tf-fontstyle.css">
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

	<jsp:include page="header.jsp" />

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Dashboard</h1>
						<ol class="breadcrumb">
							<li><a href="profile">Profile</a></li>
							<li class="active">Admin</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="user-dashboard page-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>${users.size()}${msg} ${success}</h1>

					<form
						<%-- action="adminSearch" method="post" --%> class="form-inline col-md-4">
						<div class="row">
							<input type="search" name="keyword" id="searchnow"
								class="form-control" placeholder="Search users...">
							<button type="submit" class="btn btn-danger">
								Refresh Search
								<!-- <i class="tf-ion-ios-search-strong"></i> -->
							</button>
						</div>
					</form>
					<br>

					<div class="dashboard-wrapper user-dashboard">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Image</th>
										<th>Name</th>
										<th>Email</th>
										<th>Role</th>
										<th>Action</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${users}">
										<tr>
											<td>${users.indexOf(item)+1}.</td>
											<td><c:choose>
													<c:when test="${not empty item.image}">
														<img class="d-flex justify-content-center"
															src="static/images/users/${item.id}/profile/${item.image}"
															alt="${item.fname} ${item.lname}"
															style="width: 70px; height: 70px; border-radius: 50%;">
													</c:when>
													<c:otherwise>
														<p>No Image</p>
													</c:otherwise>
												</c:choose></td>
											<td>${item.fname}${item.lname}<br>
												${item.getContactinfo().street}
												${item.getContactinfo().city} ${item.getContactinfo().zip}
											</td>
											<td>${item.email}</td>

											<td>
												<form action="editrole" method="post">
													<input type="hidden" name="id" value="${item.id}">
													<select name="role" class="form-control"
														onchange="this.form.submit()">
														<option value="${item.role}">${item.role}</option>
														<option value="USER">USER</option>
														<option value="DBA">DBA</option>
														<option value="ADMIN">ADMIN</option>
													</select>
												</form>
											</td>
											<td><c:if test="${item.email ne loggedInuser}">
													<a href="#" data-toggle="modal"
														data-target="#edit${item.id}"
														title="Edit ${item.fname} ${item.lname}">Edit<i
														class="tf-pencil2"></i></a>
            |
            										

													<a href="deleteuser?id=${item.id}"
														title="Deleting ${item.fname} ${item.lname}"
														onclick="confirmed(); return false;">Delete <i
														class="tf-ion-close"></i></a>
												</c:if>
												<div class="modal fade" id="edit${item.id}">
													<div class="modal-dialog modal-md">
														<div class="modal-content">
															<!-- Modal body -->
															<div class="modal-body">
																<section class="forget-password-page account">
																	<div class="container">
																		<div class="row col-md-6">
																			<h2 class="text-center">Edit User</h2>
																			<form action="updateUser" method="post"
																				class="text-left clearfix">
																				<div class="form-group">
																					<input type="hidden" name="email"
																						class="form-control" value="${item.email}"
																						placeholder="${item.email}">
																				</div>
																				<div class="form-group">
																					<input type="text" name="fname"
																						class="form-control" placeholder="${item.fname}">
																				</div>
																				<div class="form-group">
																					<input type="text" name="lname"
																						class="form-control" placeholder="${item.lname}">
																				</div>
																				<div class="text-left">
																					<button type="submit"
																						class="btn btn-main text-center">Submit</button>
																					<button type="button"
																						class="btn btn-main btn-medium btn-danger"
																						data-dismiss="modal">Close</button>
																				</div>
																			</form>

																		</div>

																	</div>
																</section>

															</div>
														</div>

													</div>
												</div></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
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
					<ul class="social-media">
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
					</ul>
					<p class="copyright-text">Powered by Bootstrap</p>
				</div>
			</div>
		</div>
	</footer>
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

	<script>
    function confirmed() {
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