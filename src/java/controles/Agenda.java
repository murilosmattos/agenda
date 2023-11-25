/*
    Document   : prod_cad.jsp
    Created on : 18/11/2023, 
    Author     : Murilo Silva Mattos, Gustavo Reducino, Guilherme Brandão, Caio Brandão

*/
package controles;

import java.util.Date;
/**
 *
 * @author alunos
 */
public class Agenda {
    private String nome;
    private String sobre_nome;
    private String empresa;
    private String telefone;
    private String email;
    private Date data;

    public String getNome() {return nome;}
    public void setNome(String nome) {this.nome = nome;}
    public String getSobre_nome() {return sobre_nome;}
    public void setSobre_nome(String sobre_nome) {this.sobre_nome = sobre_nome;}
    public String getEmpresa() {return empresa;}
    public void setEmpresa(String empresa) {this.empresa = empresa;}
    public String getTelefone() {return telefone;}
    public void setTelefone(String telefone) {this.telefone = telefone;}
    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}
    public Date getData() {return data;}
    public void setData(Date data) {this.data = data;}

    public Agenda(String nome, String sobrenome, String empresa, String telefone, String email, Date data) {
        this.nome = nome;
        this.sobre_nome = sobrenome;
        this.empresa = empresa;
        this.telefone = telefone;
        this.email = email;
        this.data = data;
    }
}
