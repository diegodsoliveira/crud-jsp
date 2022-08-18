<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt_br">

<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->

	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<!-- Navbar include -->

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<!-- Sidebar include -->

					<jsp:include page="sidebar.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->

						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<div class="row">
										<div class="col-xl-8 col-md-8">
											<div class="card">
												<div class="card-block">
														<div class="row align-items-center">
															<div class="col-12 p-4">
																<h1 class="text-dark">JSP - Crud completo</h1>
																<p class="col-12 pl-0" style="font-size: 1rem;">Sistema
																	desenvolvido para demonstrar a aplicação de tecnologia
																	JSP, realizando um crud completo, utilizando diversos
																	tipos de entrada de dados e manipulação de dados a
																	partir de um banco de dados, bem como exportação de
																	arquivos/gráficos a partir de relatórios.</p>

																<a href="<%= request.getContextPath() %>/ServletUsuarioController?acao=listarUser" 
																		class="btn btn-primary mt-3">Iniciar teste</a>
															</div>
														</div>
													</div>
											</div>
										</div>

										<div class="col-xl-4 col-md-4">
											<div class="card bg-dark text-white">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-12 p-3">
															<h4 class="text-white">Autor</h4>
															<h1 class="text-white mb-3">Diego Oliveira</h1>
															<p class="text-white m-b-0" style="font-size: 1rem;">Analista de Sistemas</p>
															<p class="text-white m-b-0" style="font-size: 1rem;">Dev. Java Full Stack Jr.</p>
														</div>
													</div>
												</div>
												<div class="card-footer">
													<div class="row align-items-center">
														<div class="col-1">
															<a href="https://instagram.com/diegoliveiraoficial" target="blank" 
																class="text-white m-b-0"><i class="ti-instagram"></i></a>
														</div>
														<div class="col-1">
															<a href="https://github.com/diegodsoliveira" target="blank" 
																class="text-white m-b-0"><i class="ti-github"></i></a>
														</div>
														<div class="col-1">
															<a href="https://www.linkedin.com/in/diegodsoliveira/" target="blank" 
																class="text-white m-b-0"><i class="ti-linkedin"></i></a>
														</div>
														<div class="col-1">
															<a href="https://wa.me/5561991922500" target="blank" 
																class="text-white m-b-0"><i class="fa fa-brands fa-whatsapp"></i></a>
														</div>
													</div>

												</div>
											</div>
										</div>
										
									</div>
									<div class="row">
										<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-2">
											<div class="card">
												<div class="card-block align-middle">
														<div class="row ">
															<div class="col-12 p-3">
																<h3 class="text-success text-center align-middle mb-0">CSS</h3>
															</div>
														</div>
													</div>
											</div>
										</div>
										<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-2">
											<div class="card">
												<div class="card-block align-middle">
														<div class="row ">
															<div class="col-12 p-3">
																<h3 class="text-danger text-center align-middle mb-0">Java</h3>
															</div>
														</div>
													</div>
											</div>
										</div>
										<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-2">
											<div class="card">
												<div class="card-block align-middle">
														<div class="row ">
															<div class="col-12 p-3">
																<h3 class="text-primary text-center align-middle mb-0">Bootstrap</h3>
															</div>
														</div>
													</div>
											</div>
										</div>
										<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-2">
											<div class="card">
												<div class="card-block align-middle">
														<div class="row ">
															<div class="col-12 p-3">
																<h3 class="text-info text-center align-middle mb-0">PostgreSQL</h3>
															</div>
														</div>
													</div>
											</div>
										</div>
										<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-2">
											<div class="card">
												<div class="card-block align-middle">
														<div class="row ">
															<div class="col-12 p-3">
																<h3 class="text-primary text-center align-middle mb-0">JSP</h3>
															</div>
														</div>
													</div>
											</div>
										</div>
										<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-2">
											<div class="card">
												<div class="card-block align-middle">
														<div class="row ">
															<div class="col-12 p-3">
																<h3 class="text-danger text-center align-middle mb-0">Git</h3>
															</div>
														</div>
													</div>
											</div>
										</div>
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Required Jquery -->

	<jsp:include page="javascriptfile.jsp"></jsp:include>

</body>

</html>
