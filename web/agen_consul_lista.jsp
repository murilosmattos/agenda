<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Agenda" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    <title>Consulta Lista de Contatos - Geral</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-25..200"/>
    <style>
        body {
            background-color: #f8f9fa; /* Use Bootstrap background color */
            padding: 20px; /* Add some padding for better spacing */
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }      
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #DDD;
        }
        tr:hover {
            background-color: #D6EEEE;
        }            
        .material-symbols-outlined {
            font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 24
        }
        .btn-custom {
            margin-top: 20px; /* Add some margin to the button */
        }
    </style>
    
</head>
<body>
    <div class="container text-center">
        <h1 class="mt-4">Agenda [Consulta-Lista-Contatos]</h1>
        <%             
            /*-- Consulta --*/                         
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/Agenda"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão.                
                String sql = "SELECT * FROM contatos";       
                
                ResultSet rs = stmt.executeQuery(sql);
        %>        

        <table class="table mt-4">
            <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>Id.</th>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>Empresa</th>
                    <th>Telefone</th>
                    <th>Email</th>
                    <th>Salvo em</th>
                    <th>Apagar ?</th>
                    <th>Atualizar ?</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getRow() %></td>
                        <td><%= rs.getString("pk_id") %></td>

                        <td> <a href="agen_consul.jsp?con_nome=<%= rs.getString("nome") %> "> <%= rs.getString("nome") %> </a> </td>
                        <td><%= rs.getString("sobre_nome") %></td>
                        <td><%= rs.getString("empresa") %></td>
                        <td><%= rs.getString("telefone") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("dt") %></td>
                        <td> <a href="agen_apagar.jsp?id=<%= rs.getString("pk_id") %> "> <span class="material-symbols-outlined">delete</span></td>
                        <td> <a href="agen_edit.jsp?id=<%= rs.getString("pk_id") %> "> <span class="material-symbols-outlined">update</span> </td>
                    </tr>
                <%
                    }    
                %>
            </tbody>
        </table>
        <%
                stmt.close();             
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>    
        <br><br>
        <button class="btn btn-primary btn-custom" onclick="document.location='index.html'"> Início</button>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
