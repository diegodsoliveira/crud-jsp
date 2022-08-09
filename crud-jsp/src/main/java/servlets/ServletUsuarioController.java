package servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.compress.utils.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fasterxml.jackson.databind.ObjectMapper;

import beandto.BeanDtoGraficoSalarioUser;
import dao.DAOUsuarioRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.ModelLogin;
import util.ReportUtil;

@MultipartConfig
@WebServlet(urlPatterns = { "/ServletUsuarioController" })
public class ServletUsuarioController extends ServletGenericUtil {

	private static final long serialVersionUID = 1L;

	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();

	public ServletUsuarioController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {

				String idUser = request.getParameter("id");

				daoUsuarioRepository.deletarUsuario(idUser);

				List<ModelLogin> modelLogins = daoUsuarioRepository.buscarUsuarios(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);

				request.setAttribute("msg", "Excluído com sucesso.");
				request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(this.getUserLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarAjax")) {

				String idUser = request.getParameter("id");

				daoUsuarioRepository.deletarUsuario(idUser);
				response.getWriter().write("Excluido com sucesso!");

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUser")) {

				String nomeBusca = request.getParameter("inputNomeBusca");

				List<ModelLogin> dadosJsonUser = daoUsuarioRepository.buscarUsuarios(nomeBusca,
						super.getUserLogado(request));

				ObjectMapper mapper = new ObjectMapper();

				String json = mapper.writeValueAsString(dadosJsonUser);

				response.addHeader("totalPagina", String.valueOf(daoUsuarioRepository.consultaUsuarioListTotalPaginaPaginacao(nomeBusca, super.getUserLogado(request))));
				response.getWriter().write(json);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjaxPage")) {
				 
				 String nomeBusca = request.getParameter("inputNomeBusca");
				 String pagina = request.getParameter("pagina");
				 
				 List<ModelLogin> dadosJsonUser =  daoUsuarioRepository.consultaUsuarioListOffSet(nomeBusca, super.getUserLogado(request), Integer.parseInt(pagina));
				 
				 ObjectMapper mapper = new ObjectMapper();
				 
				 String json = mapper.writeValueAsString(dadosJsonUser);

				 response.addHeader("totalPagina", String.valueOf(daoUsuarioRepository.consultaUsuarioListTotalPaginaPaginacao(nomeBusca, super.getUserLogado(request))));
				 response.getWriter().write(json);
				 
			} 
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {

				String id = request.getParameter("id");

				ModelLogin usuario = daoUsuarioRepository.consultaUsuarioID(id, super.getUserLogado(request));

				request.setAttribute("msg", "Dados importados");
				request.setAttribute("modelusuario", usuario);

				List<ModelLogin> modelLogins = daoUsuarioRepository.buscarUsuarios(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
				request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(this.getUserLogado(request)));

				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUser")) {

				List<ModelLogin> modelLogins = daoUsuarioRepository.buscarUsuarios(super.getUserLogado(request));

				request.setAttribute("msg", "Usuarios carregados");
				request.setAttribute("modelLogins", modelLogins);
				request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(this.getUserLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("downloadFoto")) {
				String id = request.getParameter("id");
				
				ModelLogin modelLogin = daoUsuarioRepository.consultaUsuarioID(id, super.getUserLogado(request));
				
				if (modelLogin.getFotoUser() != null && !modelLogin.getFotoUser().isEmpty()) {
					
					response.setHeader("Content-Disposition", "attachment;filename=arquivo." + modelLogin.getExtensaoFotoUser()); // seta o cabeçalho da requisição
					new Base64();
					response.getOutputStream().write(Base64.decodeBase64(modelLogin.getFotoUser().split("\\,")[1])); // transforma a String em imagem e remove sujeira
					
				}
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("paginar")) {
				Integer offset = Integer.parseInt(request.getParameter("offset"));
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.buscarUsuariosPaginado(this.getUserLogado(request), offset);
				
				request.setAttribute("modelLogins", modelLogins);
				request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(this.getUserLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
				
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("imprimirRelatorioUser")) {
				String dataInicial = request.getParameter("dataInicial");
				String dataFinal = request.getParameter("dataFinal");
				
				if (dataInicial == null || dataInicial.isEmpty()
						&& dataFinal == null || dataFinal.isEmpty()) {
					  request.setAttribute("listaUser", daoUsuarioRepository.buscarUsuariosRel(super.getUserLogado(request)));
				} else {
					request.setAttribute("listaUser", daoUsuarioRepository.buscarUsuariosRel(super.getUserLogado(request), dataInicial, dataFinal));
				}
				
				request.setAttribute("dataInicial", dataInicial);
				request.setAttribute("dataFinal", dataFinal);
				
				request.getRequestDispatcher("principal/relUsuario.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("imprimirRelatorioPDF")
					|| acao.equalsIgnoreCase("imprimirRelatorioExcel")) {
				
				String dataInicial = request.getParameter("dataInicial");
				String dataFinal = request.getParameter("dataFinal");
				List<ModelLogin> modelLogins = null;
				
				if (dataInicial == null || dataInicial.isEmpty()
						&& dataFinal == null || dataFinal.isEmpty()) {
					
					modelLogins = daoUsuarioRepository.buscarUsuariosRel(super.getUserLogado(request));
					
				} else {
					modelLogins = daoUsuarioRepository.buscarUsuariosRel(super.getUserLogado(request), dataInicial, dataFinal);
					
				}
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("param_sub_report", request.getServletContext().getRealPath("relatorio") + File.separator);
				
				byte[] relatorio = null;
				String extensao = "";
				
				if (acao.equalsIgnoreCase("imprimirRelatorioPDF")) {
					relatorio = new ReportUtil().geraRelatorioPdf(modelLogins, "java-jsp-report", params, request.getServletContext());
					extensao = "pdf";
				} else  
					if (acao.equalsIgnoreCase("imprimirRelatorioExcel")){
					relatorio = new ReportUtil().geraRelatorioExcel(modelLogins, "java-jsp-report", params, request.getServletContext());
					extensao = "xls";
				}
				
				response.setHeader("Content-Disposition", "attachment;filename=arquivo." + extensao); // seta o cabeçalho da requisição
				response.getOutputStream().write(relatorio); // transforma a String em imagem e remove sujeira
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("graficoSalario")) {
				
				String dataInicial = request.getParameter("dataInicial");
				String dataFinal = request.getParameter("dataFinal");
				
				if (dataInicial == null || dataInicial.isEmpty()
						&& dataFinal == null || dataFinal.isEmpty()) {
					
					BeanDtoGraficoSalarioUser bdgsu = daoUsuarioRepository.montarGraficoMediaSalario(super.getUserLogado(request));
					
					ObjectMapper mapper = new ObjectMapper();
					
					String json = mapper.writeValueAsString(bdgsu);
					response.getWriter().write(json);
					
				} else {
					
					BeanDtoGraficoSalarioUser bdgsu = daoUsuarioRepository.montarGraficoMediaSalario(super.getUserLogado(request), dataInicial, dataFinal);
					
					ObjectMapper mapper = new ObjectMapper();
					
					String json = mapper.writeValueAsString(bdgsu);
					response.getWriter().write(json);
					
				}
				
				
			}

			else {
				List<ModelLogin> modelLogins = daoUsuarioRepository.buscarUsuarios(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
				request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(this.getUserLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}

		} catch (

		Exception e) {

			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String msg = "Operação realizada com sucesso!";

		try {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String perfil = request.getParameter("perfil");
			String sexo = request.getParameter("sexo");
			String cep = request.getParameter("cep");
			String logradouro = request.getParameter("logradouro");
			String numero = request.getParameter("numero");
			String bairro = request.getParameter("bairro");
			String localidade = request.getParameter("localidade");
			String uf = request.getParameter("uf");
			String dataNascimento = request.getParameter("dataNascimento");
			String rendaMensal = request.getParameter("rendamensal");
			
			if (rendaMensal != null && !rendaMensal.isEmpty()) {
				rendaMensal = rendaMensal.split("\\ ")[1].replaceAll("\\.", "").replaceAll(",", ".");
			}

			ModelLogin modelLogin = new ModelLogin();
			modelLogin.setId(id != null && !id.isEmpty() ? Long.valueOf(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setEmail(email);
			modelLogin.setLogin(login);
			modelLogin.setSenha(senha);
			modelLogin.setPerfil(perfil);
			modelLogin.setSexo(sexo);
			modelLogin.setCep(cep);
			modelLogin.setLogradouro(logradouro);
			modelLogin.setNumero(numero);
			modelLogin.setBairro(bairro);
			modelLogin.setLocalidade(localidade);
			modelLogin.setUf(uf);
			modelLogin.setDataNascimento(Date.valueOf(new SimpleDateFormat("yyy-mm-dd").format(new SimpleDateFormat("dd/mm/yyyy").parse(dataNascimento))));
			modelLogin.setRendamensal(Double.parseDouble(rendaMensal));
			
			if (ServletFileUpload.isMultipartContent(request)) {
				Part part = request.getPart("fileFoto"); // pega a foto da tela
				
				if (part.getSize() > 0) {
					
					byte[] foto = IOUtils.toByteArray(part.getInputStream()); // conver imagem para byte
					new Base64();
					String imagemBase64 = "data:image/" + part.getContentType().split("\\/")[1] + ";base64,"
							+ Base64.encodeBase64String(foto);
					
					modelLogin.setFotoUser(imagemBase64);
					modelLogin.setExtensaoFotoUser(part.getContentType().split("\\/")[1]);
					
				}

			}

			if (daoUsuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {

				msg = "Já existe um usuário com este login. Por favor, informe outro.";

			} else {
				if (modelLogin.isNovo()) {
					msg = "Gravado com sucesso.";
				} else {
					msg = "Atualizado com sucesso.";
				}
				modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin, super.getUserLogado(request));
			}

			request.setAttribute("msg", msg);
			request.setAttribute("modelusuario", modelLogin);

			List<ModelLogin> modelLogins = daoUsuarioRepository.buscarUsuarios(super.getUserLogado(request));
			request.setAttribute("modelLogins", modelLogins);
			request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(this.getUserLogado(request)));

			request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

		} catch (Exception e) {

			e.printStackTrace();

			request.setAttribute("msgerro", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);

		}
	}

}
