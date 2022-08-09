<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-BR">

<head>
<title>Java JSP</title>
<!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description"
	content="Sistema
																	desenvolvido para demonstrar a aplicação de tecnologia
																	JSP, realizando um crud completo, utilizando diversos
																	tipos de entrada de dados e manipulação de dados a
																	partir de um banco de dados, bem como exportação de
																	arquivos/gráficos a partir de relatórios." />
<meta name="keywords"
	content="bootstrap, java, jsp, html, css, tomcat, maven, git, postgresql" />
<meta name="author" content="codedthemes" />
<!-- Favicon icon -->

<link rel="icon"
	href="<%=request.getContextPath()%>/assets/images/favicon.ico"
	type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/pages/waves/css/waves.min.css"
	type="text/css" media="all">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/icon/icofont/css/icofont.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/style.css">
</head>

<body themebg-pattern="theme1">
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="loader-track">
			<div class="preloader-wrapper">
				<div class="spinner-layer spinner-blue">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-yellow">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-green">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->

	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->

					<form class="md-float-material form-material"
						action="<%=request.getContextPath()%>/ServletLogin"
						method="post">
						<input type="hidden" value="<%=request.getParameter("url")%>"
							name="url" />
						<div class="text-center">
							<img src="<%=request.getContextPath()%>/assets/images/crud.png"
								alt="crud.png" width="60" height="34">
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center">Fazer login</h3>
									</div>
								</div>
								<div class="form-group form-primary">
									<input type="text" name="login" class="form-control"
										required=""> <span class="form-bar"></span> <label
										class="float-label">Insira o login</label>
								</div>
								<div class="form-group form-primary">
									<input type="password" name="senha" class="form-control"
										required=""> <span class="form-bar"></span> <label
										class="float-label">Insira a senha</label>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">Acessar</button>
										<p class="text-danger">${msg}</p>
									</div>
								</div>
								<hr />
								<div class="row">
									<div class="col-md-10">
										<p class="text-inverse text-left m-b-0">Para acessar
											utilize:</p>
										<p class="text-inverse text-left">
											<b>login: admin, senha: admin</b>
										</p>
									</div>
									<!-- 
									<div class="col-md-2">
										<img src="assets/images/auth/Logo-small-bottom.png"
											alt="small-logo.png">
									</div>
									 -->
								</div>
							</div>
						</div>
					</form>
					<!-- end of form -->
				</div>
				<!-- end of col-sm-12 -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container-fluid -->
	</section>
	<!-- Warning Section Starts -->
	<!-- Older IE warning message -->
	<!--[if lt IE 10]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
	<!-- Warning Section Ends -->
	<!-- Required Jquery -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery-ui/jquery-ui.min.js "></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/popper.js/popper.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/bootstrap/js/bootstrap.min.js "></script>
	<!-- waves js -->
	<script src="<%=request.getContextPath()%>/assets/pages/waves/js/waves.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
	<!-- modernizr js -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/SmoothScroll.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/common-pages.js"></script>
</body>

</html>
