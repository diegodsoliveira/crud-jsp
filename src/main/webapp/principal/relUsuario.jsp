<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
											<div class="col-sm-12">
												<div class="card table-card">
													<div class="card-header">
														<h5>Relatório de Usuários</h5>
													</div>
													<div class="card-block">
														<form class=""
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="get" id="formRel">
															<input type="hidden" name="acao" id="acaoRelatorioImprimirTipo" value="imprimirRelatorioUser" />
															
															<div class="form-row align-items-center justify-content-center mb-3 border-bottom"
																	style="box-shadow: 0px 1px 20px 0px rgb(69 90 100 / 8%);">
															    <div class="col-auto">
															      <label class="col-form-label" for="dataInicial">Data Inicial</label>
															      <input type="text" class="form-control mb-3" id="dataInicial" name="dataInicial"
															      		value="${dataInicial}">
															    </div>
															    <div class="col-auto">
															      <label class="col-form-label" for="dataFinal">Data Final</label>
															      <input type="text" class="form-control mb-3" id="dataFinal" name="dataFinal"
															      		value="${dataFinal}">
															    </div>
															    <div class="col-auto">
															      <button type="button" onclick="imprimirHtml()" class="btn btn-primary mb-3">Imprimir relatório</button>
															      <button type="button" onclick="imprimirPdf()" class="btn btn-danger mb-3">Gerar PDF</button>
															      <button type="button" onclick="imprimirExcel()" class="btn btn-success mb-3">Excel</button>
															    </div>
														  </div>
														</form>
														<div class="container">
															<table class="table table-hover table-bordered"  id="tableResultadoView">
																<thead class="thead-light">
																	<tr>
																		<th scope="col">id</th>
																		<th scope="col">Nome</th>
																		<th scope="col">Telefones</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${listaUser}" var="listaUser">
																		<tr>
																			<td><c:out value="${listaUser.id}"></c:out></td>
																			<td><c:out value="${listaUser.nome}"></c:out></td>
																			<c:forEach items="${listaUser.telefones}" var="fone">
																				<td class="d-flex"><c:out value="${fone.numero}"></c:out></td>
																			</c:forEach>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
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
	<script>
	function imprimirHtml() {
		document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioUser';
		$("#formRel").submit();
	}
	
	function imprimirPdf() {
		document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioPDF';
		$("#formRel").submit();
		return false;
	}
	
	function imprimirExcel() {
		document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioExcel';
		$("#formRel").submit();
		return false;
	}
	
	$( function() {
		  
		  $("#dataNascimento,#dataInicial,#dataFinal").datepicker({
			    dateFormat: 'dd/mm/yy',
			    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
			    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
			    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
			    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
			    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
			    nextText: 'Próximo',
			    prevText: 'Anterior'
			});
	} );
	
	</script>
	
</body>

</html>
