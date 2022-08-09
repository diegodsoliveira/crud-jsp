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
															
															<div class="form-row col-auto align-items-center justify-content-center mb-3 border-bottom">
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
																<div
																	class="col-12 col-sm-2 d-flex justify-content-center">
																	<button type="button" onclick="gerarGrafico()"
																		class="btn btn-primary mb-3">Gerar
																		gráfico</button>
																</div>
															</div>
														</form>
														<div class="container">
															<div>
																<canvas id="myChart"></canvas>
															</div>
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
	    var myChart = new Chart(document.getElementById('myChart'))
	
		function gerarGrafico() {
			
			var urlAction = document.getElementById('formRel').action
			var dataInicial = document.getElementById('dataInicial').value
			var dataFinal = document.getElementById('dataFinal').value
			
			$.ajax({
				method : 'get',
				url : urlAction,
				data : 'dataInicial=' + dataInicial + '&dataFinal=' + dataFinal + '&acao=graficoSalario'
			}).done(function(response) {
				
				var json = JSON.parse(response)
				
				myChart.destroy()
				
				myChart = new Chart(document.getElementById('myChart'), {
					type : 'bar',
					data : {
						labels : json.perfis,
						datasets : [ {
							label : 'Média salarial: R$',
							backgroundColor : 'rgb(255, 99, 132)',
							borderColor : 'rgb(255, 99, 132)',
							data : json.salarios,
						} ]
					},
					options : {}
				});
				
			}).fail(function(xhr, status, errorThrown) {

				alert('Erro ao buscar dados: ' + xhr.responseText);
				
			});

		}

		
		$(function() {

			$("#dataNascimento,#dataInicial,#dataFinal")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});
	</script>

</body>

</html>
