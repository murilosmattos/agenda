<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Agenda" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Contatos</title>
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
        <h1 class="mt-4">Agenda [Contato]</h1>
        <%
            request.setCharacterEncoding("UTF-8"); // Muda o Encoding para UTF-8 na requisição.// maçã inclui certo
            /*-- Entrada --*/
            String nome = request.getParameter("con_nome");
            String sobrenome = request.getParameter("con_sobrenome");
            String empresa = request.getParameter("con_empresa");
            String telefone = request.getParameter("con_telefone");
            String email = request.getParameter("con_email");
            
            Date data = new SimpleDateFormat("yyy-MM-dd").parse(request.getParameter("data"));

            /*-- Process --*/
            Agenda agen = new Agenda(nome, sobrenome, empresa, telefone, email, data);

            /*-- Saída --*/
            out.println("<div class='mt-4'><b>Registro [Contato]:</b></div>");

            out.println("<div> Nome......: " + agen.getNome() + "</div>");
            out.println("<div> Sobrenome......: " + agen.getSobre_nome() + "</div>");
            out.println("<div> Empresa......: " + agen.getEmpresa() + "</div>");
            out.println("<div> Telefone......: " + agen.getTelefone() + "</div>");
            out.println("<div> Email......: " + agen.getEmail() + "</div>");
            out.println("<div> Salvo em: " + agen.getData() + "</div>");

            String s_dt_fab = new SimpleDateFormat("yyy/MM/dd").format(agen.getData());
            out.println("<div> Data (str) de Salvo em: " + s_dt_fab + "</div>");

            /*-- Gravação --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/agenda"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");              

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "INSERT INTO contatos(nome, sobre_nome, empresa, telefone, email, dt) VALUES(1,'Guilherme', 'Oliveira Andrade', 'Wolpac', '11942617776', 'guilherme.andrad@hotmail.com', '2023-06-01');" --*/
                String sql = "INSERT INTO contatos(nome, sobre_nome, empresa, telefone, email, dt) " +
                       "VALUES ('"
                                 + agen.getNome() + "', '" 
                                 + agen.getSobre_nome() + "', '" 
                                 + agen.getEmpresa() + "', '" 
                                 + agen.getTelefone() + "', '" 
                                 + agen.getEmail() + "', '" 
                                 + s_dt_fab + "')";          
                
                /*-- out.println("<br> <br>SQL: " + sql); --*/
                stmt.executeUpdate(sql);
                stmt.close();
                
                out.println("<div class='mt-4'><b>Registro inserido com sucesso!</b></div>");
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
