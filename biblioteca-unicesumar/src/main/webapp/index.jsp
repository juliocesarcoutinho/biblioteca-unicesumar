<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Biblioteca Cesumar</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />
</head>
<body>
  <header>
    <h2>Biblioteca Cesumar</h2>
    <p>Bem-vindo ao sistema de gerenciamento de livros</p>
  </header>
  <div class="container">
    <h1>Sistema da Biblioteca - Universidade Cesumar</h1>
    <hr/>
    <p>
      <a href="${pageContext.request.contextPath}/livros?action=novo" class="btn">Cadastrar Novo Livro</a>
    </p>
    <p>
      <a href="${pageContext.request.contextPath}/livros" class="btn">Ver Acervo de Livros</a>
    </p>
  </div>
  <footer>
    © 2025 Universidade Cesumar. Todos os direitos reservados Sistema Fictício para MAPA.
  </footer>
</body>
</html>
