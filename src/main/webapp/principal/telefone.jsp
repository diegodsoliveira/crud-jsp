<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
											<div class="col-xl-6 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>Telefones do usuário</h5>
													</div>
													<div class="card-block">
														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletTelefone"
															method="post" id="formTelefone">
															<input type="hidden" name="acao" id="acao" value="" />

															<div class="form-group form-default form-static-label">
																<input type="text" readonly="readonly" name="id" id="id"
																	class="form-control" autocomplete="off"
																	value="${modelLogin.id}" />
																<span class="form-bar"></span> <label
																	class="float-label">ID</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" readonly="readonly" name="nome"
																	id="nome" class="form-control"
																	value="${modelLogin.nome}" />
																<span class="form-bar"></span> <label
																	class="float-label">Nome
																	do usuário</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="telefone" id="telefone"
																	class="form-control" />
																<span class="form-bar"></span> <label
																	class="float-label">Telefone</label>
															</div>

															<button
																class="btn btn-mat waves-effect waves-light btn-success">
																Salvar</button>
																
																<a href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${modelLogin.id}"
																class="btn btn-mat waves-effect waves-light btn-secondary">
																Voltar</a>
														</form>
													</div>
													<span id="msg">${msg}</span>
												</div>
											</div>
											<!-- Card block view -->
											<div class="col-xl-6 col-md-12">
												<div class="card table-card">
													<div class="card-header">
														<h5>Lista de telefones</h5>
													</div>
													<div class="card-block">
														<table class="table table-hover" id="tableResultadoView">
															<thead>
																<tr class="bg-primary">
																	<th>ID</th>
																	<th>Telefone</th>
																	<th>Deletar</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${modelTelefones}" var="mT">
																	<tr>
																		<td><c:out value="${mT.id}"></c:out></td>
																		<td><c:out value="${mT.numero}"></c:out></td>
																		<td><a class="btn btn-danger"
																			href="<%= request.getContextPath() %>/ServletTelefone?acao=deletar&id=${mT.id}&userPai=${modelLogin.id}">Excluir</a>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
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
	<script>
		$('#telefone').keypress(function(event) {
			return /\d/.test(String.fromCharCode(event.keyCode))
		})
	</script>
</body>
</html>
