<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Agenda" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Contatos</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Agenda [Contatos Contém]</h1>
        <%
            /*-- Entrada --*/
            String con_nome = request.getParameter("con_nome");           

            /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/Agenda"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "SELECT * FROM produto WHERE nome LIKE '%de%'" --*/
                String sql = "SELECT * FROM contatos WHERE nome LIKE '%" + con_nome + "%'";       
                
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    out.println("<div class='mt-4'><b>Registro(s):</b> " + rs.getRow() + "</div>");
                    out.println("<div> Id: " + rs.getString("pk_id") + "</div>");
                    out.println("<div> Nome: " + rs.getString("nome") + "</div>");
                    out.println("<div> Sobrenome: " + rs.getString("sobre_nome") + "</div>");
                    out.println("<div> Empresa: " + rs.getString("empresa") + "</div>");
                    out.println("<div> Telefone: " + rs.getString("telefone") + "</div>");
                    out.println("<div> Email: " + rs.getString("email") + "</div>");
                    out.println("<div> Salvo em: " + rs.getString("dt") + "</div>");
                }                          
                stmt.close();                
                
            } catch (Exception ex) {
                out.println("<div class='mt-4'><b>Erro:</b> " + ex + "</div>");
            }
        %>    
        <br><br>
        <button type="button" class="btn btn-primary" onclick="document.location='index.html'">Início</button>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
