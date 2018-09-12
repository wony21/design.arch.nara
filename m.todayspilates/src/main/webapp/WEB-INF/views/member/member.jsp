<%@page import="m.todays.pilates.common.SessionUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%
	String userLv = SessionUtils.getCurrentUser().getUserLv();
	String memberNo = SessionUtils.getCurrentUser().getMemberNo();
	String storCd = SessionUtils.getCurrentUser().getStorCd();
	String username2 = SessionUtils.getCurrentUser().getUsername2();
	request.setAttribute("userLv", userLv);
	request.setAttribute("memberNo", memberNo);
	request.setAttribute("storCd", storCd);
	request.setAttribute("username2", username2);
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <!--meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"-->
    <!--meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1"-->
    <meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Stylish Portfolio - Start Bootstrap Template</title>

    <link href="css/boot4/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/boot4/dashboard.css" rel="stylesheet">
    <link href="css/boot4/vendor/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="css/boot4/vendor/simple-line-icons.css" rel="stylesheet">
    <link href="css/boot4/stylish-portfolio.css" rel="stylesheet">
  </head>
  <body id="page-top">
    <!-- Navigation -->
    <a class="menu-toggle rounded" href="#">
      <i class="fa fa-bars"></i>
    </a>
    <nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a class="js-scroll-trigger"
				href="#page-top">회원<!--( ${userLv} )--> : <span class="username"></span> 님
			</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/member">Home</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/member/reservation">예약현황</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/logout" id="logout">로그아웃</a></li>
		</ul>
	</nav>

    <!-- Header -->
    <!-- header class="masthead d-flex">
      <div class="container text-center my-auto">
        <h1 class="mb-1">Todayspilates</h1>
        <h3 class="mb-5">
          <em>A Free Bootstrap Theme by Start Bootstrap</em>
        </h3>
        <a class="btn btn-primary btn-xl js-scroll-trigger" href="/member/reservation">예약현황</a>
      </div>
      <div class="overlay"></div>
    </header-->
    <header class="callout">
      <div class="container text-center">
        <h2 class="mx-auto mb-5">Welcome to
          <em>Todayspilates</em>
          STOTT PILATES</h2>
        <a class="btn btn-primary btn-xl" href="/member/reservation">나의 예약현황보기</a>
      </div>
    </header>

    <!-- About -->
    <!--  section class="content-section bg-light" id="about">
      <div class="container text-center">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h2>Stylish Portfolio is the perfect theme for your next project!</h2>
            <p class="lead mb-5">This theme features a flexible, UX friendly sidebar menu and stock photos from our friends at
              <a href="https://unsplash.com/">Unsplash</a>!</p>
            <a class="btn btn-dark btn-xl js-scroll-trigger" href="#services">What We Offer</a>
          </div>
        </div>
      </div>
    </section-->

    <!-- Services -->
    <!--  section class="content-section bg-primary text-white text-center" id="services">
      <div class="container">
        <div class="content-section-heading">
          <h3 class="text-secondary mb-0">Services</h3>
          <h2 class="mb-5">What We Offer</h2>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
            <span class="service-icon rounded-circle mx-auto mb-3">
              <i class="icon-screen-smartphone"></i>
            </span>
            <h4>
              <strong>Responsive</strong>
            </h4>
            <p class="text-faded mb-0">Looks great on any screen size!</p>
          </div>
          <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
            <span class="service-icon rounded-circle mx-auto mb-3">
              <i class="icon-pencil"></i>
            </span>
            <h4>
              <strong>Redesigned</strong>
            </h4>
            <p class="text-faded mb-0">Freshly redesigned for Bootstrap 4.</p>
          </div>
          <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
            <span class="service-icon rounded-circle mx-auto mb-3">
              <i class="icon-like"></i>
            </span>
            <h4>
              <strong>Favorited</strong>
            </h4>
            <p class="text-faded mb-0">Millions of users
              <i class="fa fa-heart"></i>
              Start Bootstrap!</p>
          </div>
          <div class="col-lg-3 col-md-6">
            <span class="service-icon rounded-circle mx-auto mb-3">
              <i class="icon-mustache"></i>
            </span>
            <h4>
              <strong>Question</strong>
            </h4>
            <p class="text-faded mb-0">I mustache you a question...</p>
          </div>
        </div>
      </div>
    </section-->

    <!-- Portfolio -->
    <!--section class="content-section" id="portfolio">
      <div class="container">
        <div class="content-section-heading text-center">
          <h3 class="text-secondary mb-0">Portfolio</h3>
          <h2 class="mb-5">Recent Projects</h2>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-6">
            <a class="portfolio-item" href="#">
              <span class="caption">
                <span class="caption-content">
                  <h2>Stationary</h2>
                  <p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
                </span>
              </span>
              <img class="img-fluid" src="css/boot4/images/stylish-portfolio/portfolio-1.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-6">
            <a class="portfolio-item" href="#">
              <span class="caption">
                <span class="caption-content">
                  <h2>Ice Cream</h2>
                  <p class="mb-0">A dark blue background with a colored pencil, a clip, and a tiny ice cream cone!</p>
                </span>
              </span>
              <img class="img-fluid" src="css/boot4/images/stylish-portfolio/portfolio-2.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-6">
            <a class="portfolio-item" href="#">
              <span class="caption">
                <span class="caption-content">
                  <h2>Strawberries</h2>
                  <p class="mb-0">Strawberries are such a tasty snack, especially with a little sugar on top!</p>
                </span>
              </span>
              <img class="img-fluid" src="css/boot4/images/stylish-portfolio/portfolio-3.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-6">
            <a class="portfolio-item" href="#">
              <span class="caption">
                <span class="caption-content">
                  <h2>Workspace</h2>
                  <p class="mb-0">A yellow workspace with some scissors, pencils, and other objects.</p>
                </span>
              </span>
              <img class="img-fluid" src="css/boot4/images/stylish-portfolio/portfolio-4.jpg" alt="">
            </a>
          </div>
        </div>
      </div>
    </section-->

    <!-- Call to Action -->
    <!--section class="content-section bg-primary text-white">
      <div class="container text-center">
        <h2 class="mb-4">The buttons below are impossible to resist...</h2>
        <a href="#" class="btn btn-xl btn-light mr-4">Click Me!</a>
        <a href="#" class="btn btn-xl btn-dark">Look at Me!</a>
      </div>
    </section-->

    <!-- Map -->
    <section id="contact" class="map">
      <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
      <br/>
      <small>
        <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
      </small>
    </section>

    <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <ul class="list-inline mb-5">
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white mr-3" href="#">
              <i class="icon-social-facebook"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white mr-3" href="#">
              <i class="icon-social-twitter"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white" href="#">
              <i class="icon-social-github"></i>
            </a>
          </li>
        </ul>
        <p class="text-muted small mb-0">Copyright &copy; Your Website 2017</p>
      </div>
    </footer>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
	
    <!-- Bootstrap core JavaScript -->
    <script src="js/boot4/jquery.min.js"></script>
    <script src="js/boot4/js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/boot4/jquery.easing.min.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/boot4/stylish-portfolio.min.js"></script>
    <script src="js/member.js"></script>
    <script>
		let memberNo = '<%=memberNo%>';
		let storCd = '<%=storCd%>';
		let username2 = '<%=username2%>';
		let user = {};
		user.memberNo = memberNo;
		user.storCd = storCd;
		user.lsnCd = '';
		user.username = username2;
		
		window.localStorage.setItem('todays', JSON.stringify(user));
	</script>
  </body>

</html>
