package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import beandto.BeanDtoGraficoSalarioUser;
import connection.SingleConnectionBanco;
import model.ModelLogin;
import model.ModelTelefone;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public BeanDtoGraficoSalarioUser montarGraficoMediaSalario(Long userLogado, String dataInicial, String dataFinal)
			throws Exception {

		String sql = "select avg(rendamensal) as media_salarial, perfil from model_login where usuario_id=? and datanascimento >= ? and datanascimento <= ? group by perfil";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, userLogado);
		statement.setDate(2, Date.valueOf(
				new SimpleDateFormat("yyy-mm-dd").format(new SimpleDateFormat("dd/mm/yyyy").parse(dataInicial))));
		statement.setDate(3, Date.valueOf(
				new SimpleDateFormat("yyy-mm-dd").format(new SimpleDateFormat("dd/mm/yyyy").parse(dataFinal))));

		ResultSet retornoBanco = statement.executeQuery();

		List<String> perfis = new ArrayList<>();
		List<Double> salarios = new ArrayList<>();

		BeanDtoGraficoSalarioUser beanDtoGraficoSalarioUser = new BeanDtoGraficoSalarioUser();

		while (retornoBanco.next()) {
			Double medial_salarial = retornoBanco.getDouble("media_salarial");
			String perfil = retornoBanco.getString("perfil");

			perfis.add(perfil);
			salarios.add(medial_salarial);
		}

		beanDtoGraficoSalarioUser.setPerfis(perfis);
		beanDtoGraficoSalarioUser.setSalarios(salarios);

		return beanDtoGraficoSalarioUser;
	}

	public BeanDtoGraficoSalarioUser montarGraficoMediaSalario(Long userLogado) throws Exception {

		BeanDtoGraficoSalarioUser beanDtoGraficoSalarioUser = new BeanDtoGraficoSalarioUser();
		List<String> perfis = new ArrayList<>();
		List<Double> salarios = new ArrayList<>();
		String sql = "select avg(rendamensal) as media_salarial, perfil from model_login where usuario_id=? group by perfil";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, userLogado);

		ResultSet retornoBanco = statement.executeQuery();

		while (retornoBanco.next()) {
			Double medial_salarial = retornoBanco.getDouble("media_salarial");
			String perfil = retornoBanco.getString("perfil");

			perfis.add(perfil);
			salarios.add(medial_salarial);
		}

		beanDtoGraficoSalarioUser.setPerfis(perfis);
		beanDtoGraficoSalarioUser.setSalarios(salarios);

		return beanDtoGraficoSalarioUser;
	}

	public PreparedStatement preparaStringSqlGravar(ModelLogin obj, Long idUserLogado) throws Exception {

		String sql = "INSERT INTO model_login(senha, login, nome, email, usuario_id, perfil, sexo, cep, logradouro, bairro, localidade, uf, numero, datanascimento, rendamensal)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, obj.getSenha());
		statement.setString(2, obj.getLogin());
		statement.setString(3, obj.getNome());
		statement.setString(4, obj.getEmail());
		statement.setLong(5, idUserLogado);
		statement.setString(6, obj.getPerfil());
		statement.setString(7, obj.getSexo());
		statement.setString(8, obj.getCep());
		statement.setString(9, obj.getBairro());
		statement.setString(10, obj.getLocalidade());
		statement.setString(11, obj.getLogradouro());
		statement.setString(12, obj.getUf());
		statement.setString(13, obj.getNumero());
		statement.setDate(14, obj.getDataNascimento());
		statement.setDouble(15, obj.getRendamensal());

		return statement;
	}

	public PreparedStatement preparaStringSqlUpdate(ModelLogin obj) throws Exception {

		String sql = "UPDATE model_login SET senha=?, login=?, nome=?, email=?, perfil=?, sexo=?,"
				+ " cep=?, bairro=?, localidade=?, logradouro=?, uf=?, numero=?, datanascimento=?, rendamensal=? "
				+ "WHERE id=?";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, obj.getSenha());
		statement.setString(2, obj.getLogin());
		statement.setString(3, obj.getNome());
		statement.setString(4, obj.getEmail());
		statement.setString(5, obj.getPerfil());
		statement.setString(6, obj.getSexo());
		statement.setString(7, obj.getCep());
		statement.setString(8, obj.getBairro());
		statement.setString(9, obj.getLocalidade());
		statement.setString(10, obj.getLogradouro());
		statement.setString(11, obj.getUf());
		statement.setString(12, obj.getNumero());
		statement.setDate(13, obj.getDataNascimento());
		statement.setDouble(14, obj.getRendamensal());
		statement.setLong(15, obj.getId());

		return statement;
	}

	public ModelLogin setaCamposConsulta(ModelLogin objeto, ResultSet resultado) throws Exception {

		objeto.setEmail(resultado.getString("email"));
		objeto.setId(resultado.getLong("id"));
		objeto.setLogin(resultado.getString("login"));
		objeto.setNome(resultado.getString("nome"));
		objeto.setUserAdmin(resultado.getBoolean("useradmin"));
		objeto.setPerfil(resultado.getString("perfil"));
		objeto.setSexo(resultado.getString("sexo"));
		objeto.setSenha(resultado.getString("senha"));
		objeto.setCep(resultado.getString("cep"));
		objeto.setLogradouro(resultado.getString("logradouro"));
		objeto.setBairro(resultado.getString("bairro"));
		objeto.setLocalidade(resultado.getString("localidade"));
		objeto.setUf(resultado.getString("uf"));
		objeto.setNumero(resultado.getString("numero"));
		objeto.setFotoUser(resultado.getString("fotouser"));
		objeto.setExtensaoFotoUser(resultado.getString("extensaofotouser"));
		objeto.setDataNascimento(resultado.getDate("datanascimento"));
		objeto.setRendamensal(resultado.getDouble("rendamensal"));

		return objeto;
	}

	public int totalPagina(Long usuarioLogado) throws Exception {
		String sql = "select count(1) as total from model_login where usuario_id = " + usuarioLogado;
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultado = statement.executeQuery();

		resultado.next();

		Double cadastros = resultado.getDouble("total");

		Double porPagina = 5.0;

		Double pagina = cadastros / porPagina;

		Double resto = pagina % 2;

		if (resto > 0) {
			pagina++;
		}

		return pagina.intValue();

	}

	public ModelLogin gravarUsuario(ModelLogin obj, Long idUserLogado) throws Exception {
		String sql;

		if (obj.isNovo()) { // grava um novo usuário

			PreparedStatement statement = preparaStringSqlGravar(obj, idUserLogado);

			statement.execute();
			connection.commit();

			if (obj.getFotoUser() != null && !obj.getFotoUser().isEmpty()) {

				sql = "update model_login set fotouser=?, extensaofotouser=? where login=?";

				statement.setString(1, obj.getFotoUser());
				statement.setString(2, obj.getExtensaoFotoUser());
				statement.setString(3, obj.getLogin());

				statement.execute();
				connection.commit();
			}

		} else { // atualiza usuário existente

			PreparedStatement statement = preparaStringSqlUpdate(obj);

			statement.executeUpdate();
			connection.commit();

			if (obj.getFotoUser() != null && !obj.getFotoUser().isEmpty()) {

				sql = "update model_login set fotouser=?, extensaofotouser=? where id=?";
				statement = connection.prepareStatement(sql);

				statement.setString(1, obj.getFotoUser());
				statement.setString(2, obj.getExtensaoFotoUser());
				statement.setLong(3, obj.getId());

				statement.execute();
				connection.commit();
			}

		}
		return this.consultaUsuario(obj.getLogin(), idUserLogado);

	}

	public List<ModelLogin> buscarUsuarios(String nomeUser, Long idUserLogado) throws Exception {
		List<ModelLogin> usuarios = new ArrayList<>();
		String sql = "select * from model_login where upper(nome) like upper(?) and useradmin is false and usuario_id = "
				+ idUserLogado + "limit 5";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, "%" + nomeUser + "%");

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();

			modelLogin = setaCamposConsulta(modelLogin, resultado);

			usuarios.add(modelLogin);
		}

		return usuarios;
	}

	public List<ModelLogin> buscarUsuarios(Long idUserLogado) throws Exception {
		List<ModelLogin> usuarios = new ArrayList<ModelLogin>();
		String sql = "select * from model_login where useradmin is false and usuario_id = ? order by nome asc limit 5";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, idUserLogado);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();

			modelLogin = setaCamposConsulta(modelLogin, resultado);

			usuarios.add(modelLogin);
		}

		return usuarios;
	}

	public List<ModelLogin> buscarUsuariosRel(Long idUserLogado) throws Exception {
		List<ModelLogin> usuarios = new ArrayList<ModelLogin>();
		String sql = "select * from model_login where useradmin is false and usuario_id = ? order by nome asc";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, idUserLogado);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();

			modelLogin = setaCamposConsulta(modelLogin, resultado);
			modelLogin.setTelefones(this.listTelefone(modelLogin.getId()));

			usuarios.add(modelLogin);
		}

		return usuarios;
	}

	public List<ModelLogin> buscarUsuariosRel(Long idUserLogado, String dataInicial, String dataFinal)
			throws Exception {
		List<ModelLogin> usuarios = new ArrayList<ModelLogin>();
		String sql = "select * from model_login where useradmin is false and usuario_id = ? and datanascimento >= ? and datanascimento <= ?";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, idUserLogado);
		statement.setDate(2, Date.valueOf(
				new SimpleDateFormat("yyy-mm-dd").format(new SimpleDateFormat("dd/mm/yyyy").parse(dataInicial))));
		statement.setDate(3, Date.valueOf(
				new SimpleDateFormat("yyy-mm-dd").format(new SimpleDateFormat("dd/mm/yyyy").parse(dataFinal))));

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();

			modelLogin = setaCamposConsulta(modelLogin, resultado);
			modelLogin.setTelefones(this.listTelefone(modelLogin.getId()));

			usuarios.add(modelLogin);
		}

		return usuarios;
	}

	public List<ModelLogin> buscarUsuariosPaginado(Long idUserLogado, Integer offset) throws Exception {
		List<ModelLogin> usuarios = new ArrayList<ModelLogin>();
		String sql = "select * from model_login where useradmin is false and usuario_id = ? order by nome asc offset ? limit 5";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, idUserLogado);
		statement.setInt(2, offset);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();

			modelLogin = setaCamposConsulta(modelLogin, resultado);
			// user.setSenha(resultado.getString("senha"));

			usuarios.add(modelLogin);
		}

		return usuarios;
	}

	public List<ModelLogin> consultaUsuarioListOffSet(String nome, Long userLogado, int offset) throws Exception {

		List<ModelLogin> retorno = new ArrayList<ModelLogin>();

		String sql = "select * from model_login  where upper(nome) like upper(?) and useradmin is false and usuario_id = ? offset "
				+ offset + " limit 5";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, "%" + nome + "%");
		statement.setLong(2, userLogado);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) { /* percorrer as linhas de resultado do SQL */

			ModelLogin modelLogin = new ModelLogin();

			modelLogin = setaCamposConsulta(modelLogin, resultado);

			retorno.add(modelLogin);
		}

		return retorno;
	}

	public int consultaUsuarioListTotalPaginaPaginacao(String nome, Long userLogado) throws Exception {

		String sql = "select count(1) as total from model_login  where upper(nome) like upper(?) and useradmin is false and usuario_id = ? ";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, "%" + nome + "%");
		statement.setLong(2, userLogado);

		ResultSet resultado = statement.executeQuery();

		resultado.next();

		Double cadastros = resultado.getDouble("total");

		Double porpagina = 5.0;

		Double pagina = cadastros / porpagina;

		Double resto = pagina % 2;

		if (resto > 0) {
			pagina++;
		}

		return pagina.intValue();

	}

	public ModelLogin consultaUsuario(String login, Long idUserLogado) throws Exception {
		ModelLogin modelLogin = new ModelLogin();
		String sql = "select * from model_login where upper(login) = upper('" + login
				+ "') and useradmin is false and usuario_id = " + idUserLogado;

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();

		if (resultado.next()) {

			modelLogin = setaCamposConsulta(modelLogin, resultado);

		}

		return modelLogin;
	}

	public ModelLogin consultaUsuarioID(Long id) throws Exception {
		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where id=? and useradmin is false";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id);

		ResultSet resultado = statement.executeQuery();

		if (resultado.next()) {

			modelLogin = setaCamposConsulta(modelLogin, resultado);

		}

		return modelLogin;
	}

	public ModelLogin consultaUsuario(String login) throws Exception {
		ModelLogin modelLogin = new ModelLogin();
		String sql = "select * from model_login where upper(login) = upper('" + login + "') and useradmin is false";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();

		if (resultado.next()) {
			modelLogin = setaCamposConsulta(modelLogin, resultado);
		}

		return modelLogin;
	}

	public ModelLogin consultaUsuarioLogado(String login) throws Exception {
		ModelLogin modelLogin = new ModelLogin();
		String sql = "select * from model_login where upper(login) = upper('" + login + "')";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();

		if (resultado.next()) {

			modelLogin = setaCamposConsulta(modelLogin, resultado);

		}

		return modelLogin;
	}

	public ModelLogin consultaUsuarioID(String id, Long idUserLogado) throws Exception {
		ModelLogin modelLogin = new ModelLogin();
		String sql = "select * from model_login where id = ? and useradmin is false and usuario_id = ?";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, Long.parseLong(id));
		statement.setLong(2, idUserLogado);
		ResultSet resultado = statement.executeQuery();

		if (resultado.next()) {

			modelLogin = setaCamposConsulta(modelLogin, resultado);

		}

		return modelLogin;
	}

	public boolean validarLogin(String login) throws Exception {
		String sql = "select count(1) > 0 as existe from model_login where upper(login) = upper('" + login + "');";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();

		resultado.next();

		return resultado.getBoolean("existe");
	}

	public void deletarUsuario(String id) throws Exception {

		String sql = "DELETE FROM model_login WHERE id = " + id + "and useradmin is false;";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.executeUpdate();
		connection.commit();
	}

	public List<ModelTelefone> listTelefone(Long id) throws Exception {

		List<ModelTelefone> retorno = new ArrayList<>();

		String sql = "select * from telefone where usuario_pai_id = ?";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setLong(1, id);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			ModelTelefone modelTelefone = new ModelTelefone();

			modelTelefone.setId(resultado.getLong("id"));
			modelTelefone.setNumero(resultado.getString("numero"));
			modelTelefone.setUsuario_pai_id(this.consultaUsuarioID(resultado.getLong("usuario_pai_id")));
			modelTelefone.setUsuario_cad_id(this.consultaUsuarioID(resultado.getLong("usuario_cad_id")));

			retorno.add(modelTelefone);
		}

		return retorno;

	}

}
