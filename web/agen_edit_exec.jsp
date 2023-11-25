<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*, java.lang.*, java.sql.*, java.util.Date"%>
<%@page import="controles.Agenda" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Alteração de Contatos</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        .output {
            margin-top: 20px;
        }

        button {
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Agenda [Alteração]</h1>

        <div class="output">
            <%-- Entrada --%>
            <% 
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("con_nome");
                String sobrenome = request.getParameter("con_sobrenome");
                String empresa = request.getParameter("con_empresa");
                String telefone = request.getParameter("con_telefone");
                String email = request.getParameter("con_email");

                Date data = new SimpleDateFormat("yyy-MM-dd").parse(request.getParameter("data"));

                /*-- Process --*/
                Agenda agen = new Agenda(nome, sobrenome, empresa, telefone, email, data);
            %>

            <br> Nome......: <%= agen.getNome() %>
            <br> Sobrenome......: <%= agen.getSobre_nome() %>
            <br> Empresa......: <%= agen.getEmpresa() %>
            <br> Telefone......: <%= agen.getTelefone() %>
            <br> Email......: <%= agen.getEmail() %>
            <br> Salvo em: <%= agen.getData() %>

            <% 
                String s_dt_fab = new SimpleDateFormat("yyy/MM/dd").format(agen.getData());
            %>
            <br> Data (str) de Salvo em: <%= s_dt_fab %>

            <%-- Gravação --%>                         
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                    String url = "jdbc:mysql://localhost:3306/agenda"; // Determina o servidor e banco(DB)
                    Connection conexao = DriverManager.getConnection(url, "root", "");           

                    Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 

                    /*-- "UPDATE produto SET nome='[value-2]', valor='[value-3]', fabricacao='[value-4]' WHERE 1" --*/
                    String sql = "UPDATE contatos SET nome='" + agen.getNome() + 
                            "', sobre_nome= '" + agen.getSobre_nome() + 
                            "', empresa= '" + agen.getEmpresa() +
                            "', telefone='" + agen.getTelefone() +
                            "', email='" + agen.getEmail() +
                            "', dt='" + s_dt_fab +
                            "' WHERE pk_id = " + id;   

                    /*-- out.println("<br> <br>SQL: " + sql); --*/
                    stmt.executeUpdate(sql);
                    stmt.close();

                    out.println("<br> Registro alterado com sucesso!");
                } catch (Exception ex) {
                    out.println("<br> Erro:" + ex);
                }
            %>   

            <br><br>
            <button class="btn btn-primary" onclick="document.location='index.html'"> Início</button>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
