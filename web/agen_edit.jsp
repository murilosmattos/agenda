<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Agenda" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alteração de Contatos</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Use Bootstrap background color */
            padding: 20px; /* Add some padding for better spacing */
        }
        h1 {
            color: #007bff; /* Bootstrap primary color */
        }
        button {
            margin-top: 20px; /* Add some margin to the button */
        }
        form {
            margin-top: 20px; /* Add some margin to the form */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Agenda [Alterar Contato]</h1>
        <%
            /*-- Entrada --*/
            String id = request.getParameter("id");
            /*-- Consulta --*/
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/agenda"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão.

                /*-- "SELECT * FROM contatos WHERE nome LIKE '%de%'" --*/
                String sql = "SELECT * FROM contatos WHERE pk_id = " + id;

                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
        %>
                    <form name="frmApagarCont" method="post" action="agen_edit_exec.jsp">
                        <div class="form-group">
                            <label for="id">Id:</label>
                            <input type="text" class="form-control" id="id" name="id" readonly="true" value="<%= rs.getString("pk_id") %>">
                        </div>
                        <div class="form-group">
                            <label for="con_nome">Nome:</label>
                            <input type="text" class="form-control" id="con_nome" name="con_nome" value="<%= rs.getString("nome") %>">
                        </div>
                        <div class="form-group">
                            <label for="con_sobrenome">Sobrenome:</label>
                            <input type="text" class="form-control" id="con_sobrenome" name="con_sobrenome" value="<%= rs.getString("sobre_nome") %>">
                        </div>
                        <div class="form-group">
                            <label for="con_empresa">Empresa:</label>
                            <input type="text" class="form-control" id="con_empresa" name="con_empresa" value="<%= rs.getString("empresa") %>">
                        </div>
                        <div class="form-group">
                            <label for="con_telefone">Telefone:</label>
                            <input type="text" class="form-control" id="con_telefone" name="con_telefone" value="<%= rs.getString("telefone") %>">
                        </div>
                        <div class="form-group">
                            <label for="con_email">Email:</label>
                            <input type="text" class="form-control" id="con_email" name="con_email" value="<%= rs.getString("email") %>">
                        </div>
                        <div class="form-group">
                            <label for="data">Alterado em:</label>
                            <input type="date" class="form-control" id="data" name="data" value="<%= rs.getString("dt") %>">
                        </div>
                        <button type="reset" class="btn btn-secondary">Limpar</button>
                        <button type="submit" class="btn btn-primary" name="salvar">Salvar</button>
                    </form>
        <%
                }
                stmt.close();

            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>   

        <br><br>

        <a class="btn btn-primary" href="index.html">Início</a>
        <a class="btn btn-warning" href="agen_consul.jsp">Consulta</a>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
