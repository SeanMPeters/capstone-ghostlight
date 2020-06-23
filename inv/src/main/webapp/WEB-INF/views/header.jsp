<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation">
		<div class="container">
			<div class="navbar-header">
				<h2 class="menu-title">Main Menu</h2>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<!-- / .navbar-header -->

			<!-- Navbar Links -->
			<div id="navbar" class="navbar-collapse collapse text-center">
				<ul class="nav navbar-nav">

					<!-- Home -->
					<li><a id="_home" href="home">Home</a></li>
					<!-- / Home -->
					<li><a id="_contact" href="contactus"> Contact </a></li>
					<li><a id="_about" href="about">About</a></li>
					<!-- Pages -->
					<li class="dropdown full-width dropdown-slide"><a id="co"
						href="#" class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-delay="350" role="button"
						aria-haspopup="true" aria-expanded="false">Companies<span
							class="tf-ion-ios-arrow-down"></span></a>
						<div class="dropdown-menu">
							<div class="row">

								<!-- Introduction -->
								<div class="col-sm-3 col-xs-12">
									<ul>
										<li class="dropdown-header">Info</li>
										<li role="separator" class="divider"></li>
										<li><a id="search" href="search">Search</a></li>											
									</ul>
								</div>




								<!-- Mega Menu -->
								<div class="col-sm-3 col-xs-12">
									<a href="shop"> <img class="img-responsive"
										src="static/images/stagepic3.jpg" alt="menu image" />
									</a>
								</div>
							</div>
							<!-- / .row -->
						</div> <!-- / .dropdown-menu --></li>
					<!-- / Pages -->


					<c:choose>
						<c:when test="${empty loggedInuser}">
							<li><a href="login">Login </a></li>
							<li><a href="register">Register </a></li>
						</c:when>
						<c:otherwise>
							<li><a href="profile"> My Profile</a></li>
							<c:if test="${role eq 'ADMIN'}">
								<li><a href="admin">Admin</a></li>
							</c:if>
							<li><a href="logout"> Logout</a></li>
						</c:otherwise>
					</c:choose>


				</ul>
				<!-- / .nav .navbar-nav -->

			</div>
			<!--/.navbar-collapse -->
		</div>
		<!-- / .container -->
	</nav>
</section>