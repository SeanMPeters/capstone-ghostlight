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
<meta name="description" content="Aviato E-Commerce Template">

<meta name="author" content="Themefisher.com">

<title>Search</title>

<!-- Mobile Specific Meta-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="static/images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet" href="static/plugins/themefisher-font/tf-fontstyle.css">
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
						<h1 class="page-name">Search</h1>
						<ol class="breadcrumb">
							<li><a href="home">Home</a></li>
							<li class="active">Search</li>
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
					<h1>${companies.size()} ${msg}${success}</h1>

					<form
						<%-- action="adminSearch" method="post" --%> class="form-inline col-md-4">
						<div class="row">
							<input type="search" name="keyword" id="searchnow"
								class="form-control" placeholder="Search...">
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
										<!-- 	<th><h2>#</h2></th> -->
										<th><h2>
												<b>COMPANY</b>
											</h2></th>
										<th><h2>
												<b>ADDRESS</b>
											</h2></th>
										<th><h2>
												<b>PHONE</b>
											</h2></th>
											<th><h2>
												<b>STATUS</b>
											</h2></th>
											<th><h2>
												<b>SEATING</b>
											</h2></th>
										<th><h2>
												<b>WEBSITE</b>
											</h2></th>
										<c:if test="${role eq 'ADMIN'}">
											<th><h2>
													<b>ADMIN</b>
												</h2></th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${companies}">
										<tr>
											<%-- <td>${companies.indexOf(item)+1}</td> --%>
											<td><a href="singlepage?companyId=${item.companyId}"><button
														type="submit" id="submiter"
														class="btn btn-main text-center">${item.compName}</button></a></td>
											<td>${item.compStreet}<br> ${item.compCity},
												${item.compState} ${item.compZip}
											</td>
											<td>${item.compPhone}</td>
											<td>${item.compStatus}</td>
											<td>${item.compSeating}</td>
											<td><a href="${item.compUrl}">${item.compName}</a></td>
											<c:if test="${role eq 'ADMIN'}">
											<td><a href="#" data-toggle="modal"
												data-target="#edit${item.companyId}"
												title="Edit ${item.compName}">Edit<i
													class="tf-pencil2"></i></a> | <a
												href="deleteuser?id=${item.companyId}"
												title="Deleting ${item.compName}"
												onclick="confirmed(); return false;">Delete <i
													class="tf-ion-close"></i></a></td>
											</c:if>
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

	<!-- 
    Essential Scripts
    =====================================-->
	<!-- 	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  -->

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