<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Acervo de Livros - Biblioteca Cesumar</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alerta.css" />
</head>
<body>
    <header>
        <h2>Biblioteca Cesumar</h2>
        <p>Acervo de Livros</p>
    </header>

    <div class="container">
        <h1>Acervo de Livros</h1>

        <div>
            <a href="${pageContext.request.contextPath}/" class="btn">Voltar</a>
            <a href="${pageContext.request.contextPath}/livros?action=novo" class="btn">Novo Livro</a>
        </div>

        <c:if test="${not empty mensagemSucesso}">
            <div id="alertaSucesso" class="alerta alerta-sucesso">${mensagemSucesso}</div>
        </c:if>
        <c:if test="${not empty mensagemErro}">
            <div id="alertaErro" class="alerta alerta-erro">${mensagemErro}</div>
        </c:if>

        <c:choose>
            <c:when test="${empty livros}">
                <div class="empty-message">
                    Nenhum livro cadastrado no acervo.
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                    <tr>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Ano</th>
                        <th>ISBN</th>
                        <th class="action-column">Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${livros}" var="livro" varStatus="status">
                        <tr>
                            <td data-label="Título">${livro.titulo}</td>
                            <td data-label="Autor">${livro.autor}</td>
                            <td data-label="Ano">${livro.anoPublicacao}</td>
                            <td data-label="ISBN">${livro.isbn}</td>
                            <td class="action-column" data-label="Ações">
                                <a href="${pageContext.request.contextPath}/livros?action=editar&isbn=${livro.isbn}" class="action-btn edit-btn">Editar</a>
                                <button type="button" class="action-btn delete-btn" onclick="openModal('${livro.isbn}')">Excluir</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>

    <div id="confirmModal" class="modal" style="display:none;">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&#215;</span>
            <h2 style="text-align: center">Confirmação</h2>
            <p style="text-align: center">Tem certeza que deseja excluir este livro?</p>
            <form action="${pageContext.request.contextPath}/livros" method="get">
                <input type="hidden" name="action" value="excluir">
                <input type="hidden" id="deleteIsbn" name="isbn" value="">
                <div class="modal-buttons">
                    <input type="submit" value="Confirmar" class="btn-danger">
                    <button type="button" class="btn-secondary" onclick="closeModal()">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/alerta.js"></script>

    <footer>
        © 2025 Universidade Cesumar. Todos os direitos reservados Sistema Fictício para MAPA.
    </footer>
</body>
</html>
