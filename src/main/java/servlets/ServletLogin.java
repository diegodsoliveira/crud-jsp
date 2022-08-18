package servlets;

import java.io.IOException;

import dao.DAOLoginRepository;
import dao.DAOUsuarioRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

@WebServlet(urlPatterns = {"/principal/ServletLogin", "/ServletLogin"}) // mapeamento da url que vem da tela
public class ServletLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private DAOLoginRepository daoLoginRepository = new DAOLoginRepository();
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();

	public ServletLogin() {
	}

	/* recebe os dados pela url através de parâmetros */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
			
			request.getSession().invalidate(); // invalida a sessao
			request.getRequestDispatcher("index.jsp").forward(request, response); // redireciona
			
		} else {
			doPost(request, response);
		}
	}

	/* recebe os dados enviados por um formulário através do método POST */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String url = request.getParameter("url");

		try {

			if (login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {
				
				ModelLogin modelLogin = new ModelLogin();
				modelLogin.setLogin(login);
				modelLogin.setSenha(senha);

				if (daoLoginRepository.validarAutenticacao(modelLogin)) {
					
					modelLogin = daoUsuarioRepository.consultaUsuarioLogado(login);

					request.getSession().setAttribute("usuario", modelLogin.getLogin());
					request.getSession().setAttribute("perfilSession", modelLogin.getPerfil());
					request.getSession().setAttribute("imagemAvatar", modelLogin.getFotoUser());

					if (url == null || url.equals("null")) {
						url = "principal/principal.jsp";
					}
					
					request.getRequestDispatcher(url).forward(request, response);
					
				} else {
					
					request.setAttribute("msg", "Login ou senha inválidos");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
				}
			} else {
				
				request.setAttribute("msg", "Login ou senha inválidos");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
			
		}

	}

}
