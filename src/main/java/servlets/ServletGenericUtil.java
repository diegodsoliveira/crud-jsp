package servlets;

import java.io.Serializable;

import dao.DAOUsuarioRepository;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import model.ModelLogin;

public class ServletGenericUtil extends HttpServlet implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
	
	public Long getUserLogado(HttpServletRequest request) throws Exception {
		
		String usuarioLogado = (String) request.getSession().getAttribute("usuario"); 
		
		return daoUsuarioRepository.consultaUsuarioLogado(usuarioLogado).getId();
	}
	
	public ModelLogin getUserLogadoObj(HttpServletRequest request) throws Exception {
		
		String usuarioLogado = (String) request.getSession().getAttribute("usuario"); 
		
		return daoUsuarioRepository.consultaUsuarioLogado(usuarioLogado);
	}
	
}
