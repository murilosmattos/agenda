<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Agenda" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apagar Contatos</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: white; /* Set a white background */
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
        <h1 class="mt-4">Contatos [Apagar]</h1>
        <%
            /*-- Entrada --*/
            String id = request.getParameter("id"); //Recebendo do .html

            /*-- Exec. DB --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/agenda"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "INSERT INTO produto(nome, valor, fabricacao) VALUES ('Suco Verde', 10.50, '2023/05/23')" --*/
                String sql = "DELETE FROM contatos WHERE pk_id = " + id;            
                
                /*-- out.println("<br> <br>SQL: " + sql); --*/
                int i = stmt.executeUpdate(sql);
                
                if (i > 0){
                    out.println("<br> Registro excluído com sucesso!");                    
                } else {
                    out.println("<br> Erro na instrução!");
                }
                stmt.close();
                
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
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
