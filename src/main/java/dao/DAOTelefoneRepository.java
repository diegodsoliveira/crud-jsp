package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelTelefone;

public class DAOTelefoneRepository {

	private Connection connection;
	
	DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();

	public DAOTelefoneRepository() {
		connection = SingleConnectionBanco.getConnection();
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
			modelTelefone.setUsuario_pai_id(daoUsuarioRepository.consultaUsuarioID(resultado.getLong("usuario_pai_id")));
			modelTelefone.setUsuario_cad_id(daoUsuarioRepository.consultaUsuarioID(resultado.getLong("usuario_cad_id")));
			
			retorno.add(modelTelefone);
		}
		
		return retorno;

	}

	public void gravaTelefone(ModelTelefone modelTelefone) throws Exception {
		String sql = "insert into telefone(numero, usuario_pai_id, usuario_cad_id) VALUES (?, ?, ?);";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, modelTelefone.getNumero());
		statement.setLong(2, modelTelefone.getUsuario_pai_id().getId());
		statement.setLong(3, modelTelefone.getUsuario_cad_id().getId());

		statement.execute();
		connection.commit();
	}

	public void deleteFone(Long id) throws SQLException {
		String sql = "delete from telefone where id=?";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setLong(1, id);

		statement.executeUpdate();

		connection.commit();
	}

	public boolean isTelefoneIgual(String numero, String idUser) throws Exception {
		String sql = "select count(1) > 0 as existe from telefone where usuario_pai_id=? and numero='" + numero + "\'";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, Long.valueOf(idUser));
		ResultSet resultado = statement.executeQuery();

		resultado.next();

		return resultado.getBoolean("existe");
	}

}
