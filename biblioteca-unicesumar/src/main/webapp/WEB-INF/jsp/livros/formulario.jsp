<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${modoEdicao ? 'Editar' : 'Cadastrar'} Livro - Biblioteca Cesumar</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/validation.css" />
</head>
<body>
    <header>
        <h2>Biblioteca Cesumar</h2>
        <p>${modoEdicao ? 'Editar' : 'Cadastrar'} Livro</p>
    </header>

    <div class="container">
        <h1>${modoEdicao ? 'Editar' : 'Cadastrar'} Livro</h1>

        <c:if test="${not empty mensagemErro}">
            <div class="message error">
                ${mensagemErro}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/livros" method="post" id="livroForm" novalidate>
            <input type="hidden" name="action" value="salvar">
            <c:if test="${modoEdicao}">
                <input type="hidden" name="originalIsbn" value="${originalIsbn}">
            </c:if>

            <div class="form-group">
                <label for="titulo" class="required">Título</label>
                <input type="text" id="titulo" name="titulo" value="${livro.titulo}" maxlength="100" class="input-field">
                <span class="error-message" id="titulo-error"></span>
            </div>

            <div class="form-group">
                <label for="autor" class="required">Autor</label>
                <input type="text" id="autor" name="autor" value="${livro.autor}" maxlength="100" class="input-field">
                <span class="error-message" id="autor-error"></span>
            </div>

            <div class="form-group">
                <label for="anoPublicacao" class="required">Ano de Publicação</label>
                <input type="number" id="anoPublicacao" name="anoPublicacao"
                       value="${livro.anoPublicacao}" min="1900" max="2025"
                       maxlength="4" class="input-field"
                       oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 4);">
                <span class="error-message" id="anoPublicacao-error"></span>
            </div>

            <div class="form-group">
                <label for="isbn" class="required">ISBN</label>
                <input type="text" id="isbn" name="isbn" value="${livro.isbn}" maxlength="14" class="input-field">
                <span class="error-message" id="isbn-error"></span>
            </div>

            <div class="btn-container">
                <a href="${pageContext.request.contextPath}/livros" class="btn btn-secondary">Cancelar</a>
                <a href="#" onclick="validarFormulario();return false;" class="btn btn-primary">Salvar</a>
            </div>
        </form>

        <script src="${pageContext.request.contextPath}/resources/js/validation.js"></script>
    </div>

    <footer>
        © 2025 Universidade Cesumar. Todos os direitos reservados Sistema Fictício para MAPA.
    </footer>
</body>
</html>
