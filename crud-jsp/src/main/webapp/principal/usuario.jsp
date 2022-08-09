<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="pt-br">
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
														<h5>Cadastro de usuário</h5>
													</div>
													<div class="card-block">
														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post" id="formUser" enctype="multipart/form-data">
															<input type="hidden" name="acao" id="acao" value="" />

															<div class="form-group row form-static-label">
																<label class="col-sm-1 col-form-label">ID</label>
																<div class="col-sm-2">
																	<input type="text" class="form-control" name="id"
																		id="id" readonly="readonly" value="${modelusuario.id}" />
																</div>

																<div class="input-group-prepend" style="margin: auto;">
																	<c:if
																		test="${modelusuario.fotoUser != '' && modelusuario.fotoUser != null}">
																		<a
																			href="<%= request.getContextPath() %>/ServletUsuarioController?acao=downloadFoto&id=${modelusuario.id}">
																			<img class="rounded-circle shadow-4"
																			name="fotoBase64" id="fotoBase64" alt="Imagem user"
																			width="70px" src="${modelusuario.fotoUser}"
																			style="aspect-ratio: 1/1" />
																		</a>
																	</c:if>
																	<c:if
																		test="${modelusuario.fotoUser == '' || modelusuario.fotoUser == null}">
																		<img class="rounded-circle shadow-4" name="fotoBase64"
																			id="fotoBase64" alt="Imagem user" width="70px"
																			src="assets/images/avatar-1.jpg"
																			style="aspect-ratio: 1/1" />
																	</c:if>
																</div>
																<input type="file" accept="image/*"
																	onchange="visualizarImg('fotoBase64', 'fileFoto')"
																	name="fileFoto" id="fileFoto" class="form-control-file"
																	style="margin: auto 10px">
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="nome" id="nome"
																	class="form-control" value="${modelusuario.nome}" /> <span
																	class="form-bar"></span> <label class="float-label" style="color:black">Insira
																	seu nome</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelusuario.email}" /> <span
																	class="form-bar"></span> <label class="float-label" style="color:black">Email
																	(example@gmail.com)</label>
															</div>
															<div class="form-group row form-static-label">
																<label class="col-sm-2 col-form-label" style="color:black">Nascimento</label>
																<div class="col-sm-4">
																	<input type="text" name="dataNascimento" id="dataNascimento"
																		class="form-control" required="required"
																		autocomplete="off" value="${modelusuario.dataNascimento}" /> <span
																		class="form-bar"></span>
																</div>
																<label class="col-sm-2 col-form-label">Renda</label>
																<div class="col-sm-4">
																	<input type="text" name="rendamensal" id="rendamensal"
																			class="form-control" autocomplete="off" 
																			required value="${modelusuario.rendamensal}" />
																</div>
															</div>
															<div class="form-group row form-static-label">
																<label class="col-sm-2 col-form-label">Login</label>
																<div class="col-sm-4">
																	<input type="text" name="login" id="login"
																		class="form-control" required="required"
																		autocomplete="off" value="${modelusuario.login}" />
																	<div class="col-form-label">${msgerro}</div>
																</div>
																<label class="col-sm-2 col-form-label">Senha</label>
																<div class="col-sm-4">
																	<input type="password" name="senha" id="senha"
																		class="form-control" required="required"
																		autocomplete="off" value="${modelusuario.senha}" />
																</div>
															</div>

															<div class="form-group row form-static-label">
																<label class="col-sm-2">Sexo: </label>
																<div class="col-sm-4">
																<input type="radio" class="" name="sexo" value="MASCULINO" checked="checked"
																	<%ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelusuario");

																	if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
																		out.print(" ");
																		out.print("checked=\"checked\"");
																		out.print(" ");
																	
																	}%>>Masculino</input>
																<input type="radio" name="sexo" value="FEMININO"
																	<%modelLogin = (ModelLogin) request.getAttribute("modelusuario");

																	if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
																		out.print(" ");
																		out.print("checked=\"checked\"");
																		out.print(" ");
																	
																	}%>>Feminino</input>
																</div>
																<label class="col-sm-2">Perfil</label>
																<div class="col-sm-4">
																	<select name="perfil" class="form-control" required="required">
																		<option selected="selected">[Selecione o perfil]</option>
																		<option value="ADMIN"
																			<%modelLogin = (ModelLogin) request.getAttribute("modelusuario");

																		if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
																			out.print(" ");
																			out.print("selected=\selected\"");
																			out.print(" ");
																		}%>>Administrador</option>
																		<option value="SECRETARIA"
																			<%modelLogin = (ModelLogin) request.getAttribute("modelusuario");

																		if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")) {
																			out.print(" ");
																			out.print("selected=\selected\"");
																			out.print(" ");
																		}%>>Secretária</option>
																		<option value="AUXILIAR"
																			<%modelLogin = (ModelLogin) request.getAttribute("modelusuario");

																		if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")) {
																			out.print(" ");
																			out.print("selected=\selected\"");
																			out.print(" ");
																		}%>>Auxiliar</option>
																	</select>
																</div>
															</div>
															<div class="form-group row form-static-label">
																<label class="col-sm-1 col-form-label">CEP</label>
																<div class="col-sm-3">
																	<input type="text" pattern="\d{5}-?\d{3}"
																		title="Apenas números com 8 caracteres"
																		onblur="pesquisaCep()" class="form-control" name="cep"
																		id="cep" value="${modelusuario.cep}" required="required"/>
																</div>
																<label class="col-sm-2 col-form-label">Logradouro</label>
																<div class="col-sm-6">
																	<input type="text" class="form-control"
																		name="logradouro" id="logradouro"
																		value="${modelusuario.logradouro}" required="required"/>
																</div>
															</div>
															<div
																class="form-group row form-default form-static-label">
																<label class="col-sm-2 col-form-label">Número</label>
																<div class="col-sm-4">
																	<input type="number" class="form-control" name="numero"
																		id="numero" value="${modelusuario.numero}" required="required"/>
																</div>
																<label class="col-sm-2 col-form-label">Bairro</label>
																<div class="col-sm-4">
																	<input type="text" class="form-control" name="bairro"
																		id="bairro" value="${modelusuario.bairro}" required="required"/>
																</div>
															</div>
															<div
																class="form-group row form-default form-static-label">
																<label class="col-sm-2 col-form-label">Localidade</label>
																<div class="col-sm-4">
																	<input type="text" class="form-control"
																		name="localidade" id="localidade"
																		value="${modelusuario.localidade}" required="required"/>
																</div>
																<label class="col-sm-2 col-form-label">UF</label>
																<div class="col-sm-4">
																	<input type="text" class="form-control" name="uf"
																		id="uf" value="${modelusuario.uf}" required="required"/>
																</div>
															</div>
															<div class="row d-flex justify-content-center">
																<button type="button" id="novo" class="btn btn-primary col-6 col-sm-auto mb-3 mr-1"
																	onclick="limparCampos();">Novo</button>
																<button
																	class="btn btn-mat waves-effect waves-light btn-success col-6 col-sm-auto mb-3 mr-1">
																	Salvar</button>
																<c:if test="${modelusuario.id != null && modelusuario.id > 0}">
																	<a href="<%= request.getContextPath() %>/ServletTelefone?idUser=${modelusuario.id}" 
																			class="btn btn-primary col-6 col-sm-auto mb-3 mr-1">Telefone</a>
																</c:if>
																<button type="button"
																	class="btn btn-mat waves-effect waves-light btn-danger col-6 col-sm-auto mb-3 mr-1"
																	onclick="criarDeleteAjax();">Excluir</button>
																<button type="button" class="btn btn-inverse col-6 col-sm-auto mb-3 mr-1"
																	data-toggle="modal" data-target="#modalUsuario">
																	Pesquisar</button>
															</div>
														</form>
														<span id="msg">${msg}</span>
													</div>
												</div>
											</div>

											<!-- Card block view -->
											<div class="col-xl-6 col-md-12">
												<div class="card table-card">
													<div class="card-header">
														<h5>Lista de Usuários</h5>
													</div>
														<table class="table table-hover" id="tableResultadoView">
															<thead class="">
																<tr class="col-auto bg-info">
																	<th>id</th>
																	<th>Nome</th>
																	<th class="d-none d-sm-block">Email</th>
																	<th>Ver</th>
																	<th>Deletar</th>
																</tr>
															</thead>
															<tbody class="">
																<c:forEach items="${modelLogins}" var="mL">
																	<tr>
																		<td><c:out value="${mL.id}"></c:out></td>
																		<td><c:out value="${mL.nome}"></c:out></td>
																		<td class="d-none d-sm-block"><c:out value="${mL.email}"></c:out></td>
																		<td><a class="btn btn-info"
																			href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${mL.id}">Ver</a></td>
																		<td><a class="btn btn-danger"
																			href="<%= request.getContextPath() %>/ServletUsuarioController?acao=deletar&id=${mL.id}">Excluir</a></td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
														<nav class="mb-3" aria-label="Page navigation example">
														  <ul class="pagination d-flex justify-content-center">
														  
														  	<%
														  	
														  		int paginas = (int) request.getAttribute("totalPagina");
														  	
														  		for (int i = 0; i < paginas; i++) {
														  			String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&offset=" + (i * 5);
														  			
														  			out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+url+"\">"+(i+1)+"</a></li>");
														  		}
														  	%>
														  </ul>
														</nav >
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
	

	<!-- Modal -->
	<div class="modal fade" id="modalUsuario" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						usuários</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="inputNomeBusca"
							placeholder="Nome" aria-label="inputNomeBusca"
							aria-describedby="basic-addon2" />
						<div class="input-group-append">
							<button class="btn btn-success" type="button"
								onclick="buscarUsuario();">Buscar</button>
						</div>
					</div>
					<div style="max-height: 50%; overflow: scroll;">
						<table class="table" id="tableResultado">
							<thead>
								<tr class="bg-primary">
									<th scope="col">id</th>
									<th scope="col">Nome</th>
									<th scope="col" class="d-none d-sm-block">Email</th>
									<th scope="col">Editar</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<span id="totalUsuarios"></span>
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="ulPaginacaoUserAjax">

						</ul>
					</nav>	
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Required Jquery -->
	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<script type="text/javascript">
	
	$("#rendamensal").maskMoney({showSymbol:true, prefix:"R$ ", decimal:",", thousands:"."});
	
	$("#cep,#numero").keypress(function(event) {
		return /\d/.test(String.fromCharCode(event.keyCode))
	});
	
	if ($("#rendamensal").val() != null && $("#rendamensal").val() != '') {
		const formatter = new Intl.NumberFormat('pt-BR', {
			currency : 'BRL',
			minimumFractionDigits : 2
		});
		
		$("#rendamensal").val(formatter.format($("#rendamensal").val()));
		$("#rendamensal").focus();
	}
	
	var dataNascimento = $("#dataNascimento").val();
	
	if (dataNascimento != null && dataNascimento != '') {
		var dateFormat = new Date(dataNascimento);
		$("#dataNascimento").val(dateFormat.toLocaleDateString('pt-BR', {timeZone: 'UTC'}));
		$("#nome").focus();
	}
	
	$( function() {
		  
		  $("#dataNascimento").datepicker({
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
	
		
	
		function pesquisaCep() {
			var cep = $("#cep").val();

			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {
						if (!("erro" in dados)) {
							//Atualiza os campos com os valores da consulta.
							$("#cep").val(dados.cep);
							$("#logradouro").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#localidade").val(dados.localidade);
							$("#uf").val(dados.uf);
						} //end if.
						else {
							//CEP pesquisado não foi encontrado.
							alert("CEP não encontrado.");
						}
					});
		}

		function visualizarImg(fotoBase64, fileFoto) {
			var preview = document.getElementById(fotoBase64)
			var fileUser = document.getElementById(fileFoto).files[0]
			var reader = new FileReader()

			reader.onloadend = function() {
				preview.src = reader.result

			};

			if (fileUser) {
				reader.readAsDataURL(fileUser)
			} else {
				preview.src = ''
			}
		}

		function verEditar(id) {
			var urlAction = document.getElementById('formUser').action

			window.location.href = urlAction + '?acao=buscarEditar&id=' + id

		}
		
		function buscaUserPageAjax(url){
			   
		    
		    var urlAction = document.getElementById('formUser').action;
		    var nomeBusca = document.getElementById('inputNomeBusca').value;
		    
			 $.ajax({	     
			     method: "get",
			     url : urlAction,
			     data : url
					})
						.done(function(response, textStatus, xhr) {
				 
								var lista = JSON.parse(response);
								
								$('#tableResultado > tbody > tr').remove();
								$("#ulPaginacaoUserAjax > li").remove();
							
								for(var i = 0; i < lista.length; i++){
										$('#tableResultado > tbody')
											.append(
														'<tr><td>'
																+ lista[i].id
																+ '</td> <td>'
																+ lista[i].nome
																+ '</td><td class="d-none d-sm-block">'
																+ lista[i].email
																+ '</td><td><button onclick="verEditar('
																+ lista[i].id
																+ ')" type="button" class="btn btn-info">ver</button></td></tr>')
								}
								
								document.getElementById('totalUsuarios').textContent = 'Total de registros: ' + lista.length;
								
									var totalPagina = xhr.getResponseHeader('totalPagina');
									
									for (var p = 0; p < totalPagina; p++){
											
											var url = 'inputNomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina='+ (p * 5);
									
											$("#ulPaginacaoUserAjax").append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPageAjax(\''+url+'\')">'+ (p + 1) +'</a></li>'); 
											
									}
				 
					}).fail(function(xhr, status, errorThrown){
							alert('Erro ao buscar usuário por nome: ' + xhr.responseText);
					});
		    
		}

		function buscarUsuario() {
			var dadoInput = document.getElementById('inputNomeBusca').value
			if (dadoInput != null && dadoInput != '' && dadoInput.trim != '') {
				// validando campo nulo
				var urlAction = document.getElementById('formUser').action

				$
						.ajax(
								{
									method : 'get',
									url : urlAction,
									data : 'inputNomeBusca=' + dadoInput
											+ '&acao=buscarUser'
								})
						.done(
								function(response, textStatus, xhr) {
									var lista = JSON.parse(response)

									$('#tableResultado > tbody > tr').remove()
									$('#ulPaginacaoUserAjax > li').remove()

									for (var i = 0; i < lista.length; i++) {
										$('#tableResultado > tbody')
												.append(
														'<tr><td>'
																+ lista[i].id
																+ '</td> <td>'
																+ lista[i].nome
																+ '</td><td class="d-none d-sm-block">'
																+ lista[i].email
																+ '</td><td><button onclick="verEditar('
																+ lista[i].id
																+ ')" type="button" class="btn btn-info">ver</button></td></tr>')
									}
									document.getElementById("totalUsuarios").textContent = 'Total de registros: '+ lista.length
											
									var totalPagina = xhr.getResponseHeader("totalPagina")

									for (var p = 0; p < totalPagina; p++){
									      
									      var url = 'inputNomeBusca=' + dadoInput + '&acao=buscarUserAjaxPage&pagina='+ (p * 5)
									   
									      $("#ulPaginacaoUserAjax").append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPageAjax(\''+url+'\')">'+ (p + 1) +'</a></li>');
									      
									}

								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao buscar usuário: '
											+ xhr.responseText)
								})
			}
		}
		function criarDeleteAjax() {

			var elemento = document.getElementById('id').value
			if (elemento != null && elemento != '') {
				if (confirm('Tem certeza que quer excluir?')) {
					var urlAction = document.getElementById('formUser').action
					var idUser = document.getElementById('id').value

					$.ajax({
						method : 'get',
						url : urlAction,
						data : 'id=' + idUser + '&acao=deletarAjax'
					}).done(function(response) {
						limparCampos()
						document.getElementById('msg').textContent = response
					}).fail(
							function(xhr, status, errorThrown) {
								alert('Erro ao deletar usuário por id: '
										+ xhr.responseText)
							})
				}
			} else {
				alert('Os campos estão vazios. Favar informar um usuário a ser excluído!')
			}
		}
		function criarDelete() {
			if (confirm('Tem certeza que quer excluir?')) {
				document.getElementById('formUser').method = 'get'
				document.getElementById('acao').value = 'deletar'
				document.getElementById('formUser').submit()
			}
		}

		function limparCampos() {
			var elementos = document.getElementById('formUser').elements /*Retorna os elementos html dentro do form*/
			document.getElementById('fotoBase64').src="assets/images/avatar-1.jpg";
			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = ''
			}
		}
	</script>
</body>
</html>
