package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;

public class DAOVersionadorBanco implements Serializable {

	private static final long serialVersionUID = 1L;

	private Connection connection;
	
	public DAOVersionadorBanco() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public void gravarArquivoSqlRodado(String nomeArquivo) throws Exception {
		
		String sql = "INSERT INTO versionadorbanco (arquivo_sql) VALUES (?);";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, nomeArquivo);
		statement.execute();
	}
	
	public boolean arquivoSqlRodado(String nomeArquivo) throws Exception {
		
		String sql = "select count(1) > 0 as slqRodado from versionadorbanco where arquivo_sql = ?";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, nomeArquivo);
		
		ResultSet resultado = statement.executeQuery();
		
		resultado.next();
		
		return resultado.getBoolean("slqRodado");
	}
	
}
