package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class ModelLogin implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;
	private String email;
	private String login;
	private String senha;
	private Boolean useradmin;
	private String perfil;
	private String sexo;
	private String fotoUser;
	private String extensaoFotoUser;
	private String cep;
	private String logradouro;
	private String bairro;
	private String localidade;
	private String uf;
	private String numero;
	private Date dataNascimento;
	private Double rendaMensal;
	private List<ModelTelefone> telefones = new ArrayList<ModelTelefone>();
	
	public List<ModelTelefone> getTelefones() {
		return telefones;
	}

	public void setTelefones(List<ModelTelefone> telefones) {
		this.telefones = telefones;
	}

	public Double getRendamensal() {
		return rendaMensal;
	}

	public void setRendamensal(Double rendaMensal) {
		this.rendaMensal = rendaMensal;
	}

	public void setDataNascimento(Date date) {
		this.dataNascimento = date;
	}
	
	public Date getDataNascimento() {
		return dataNascimento;
	}
	
	public Boolean getUseradmin() {
		return useradmin;
	}
	public void setUseradmin(Boolean useradmin) {
		this.useradmin = useradmin;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getLocalidade() {
		return localidade;
	}
	public void setLocalidade(String localidade) {
		this.localidade = localidade;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getExtensaoFotoUser() {
		return extensaoFotoUser;
	}
	public void setExtensaoFotoUser(String extensaoFotoUser) {
		this.extensaoFotoUser = extensaoFotoUser;
	}
	
	public String getFotoUser() {
		return fotoUser;
	}
	
	public void setFotoUser(String fotoUser) {
		this.fotoUser = fotoUser;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Boolean getUserAdmin() {
		return useradmin;
	}

	public void setUserAdmin(Boolean useradmin) {
		this.useradmin = useradmin;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public boolean isNovo() {
		if (this.id == null) {
			return true; // gravar
		} else if (this.id != null && this.id > 0) {
			return false; // atualizar
		}
		return id == null;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	@Override
	public String toString() {
		return "ModelLogin [id=" + id + ", nome=" + nome + ", email=" + email + ", login=" + login + ", senha=" + senha
				+ ", useradmin=" + useradmin + ", perfil=" + perfil + ", sexo=" + sexo + ", extensaoFotoUser="
				+ extensaoFotoUser + ", cep=" + cep + ", logradouro=" + logradouro + ", bairro=" + bairro
				+ ", localidade=" + localidade + ", uf=" + uf + ", numero=" + numero + "]";
	}

}
