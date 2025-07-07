<%@ tag description="Template de Layout Base" pageEncoding="UTF-8" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="headerTitle" required="true" %>
<%@ attribute name="headerSubtitle" required="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} - Biblioteca Cesumar</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />
</head>
<body>
    <header>
        <h2>${headerTitle}</h2>
        <p>${headerSubtitle}</p>
    </header>

    <div class="container">
        <jsp:doBody/>
    </div>

    <footer>
        © 2025 Universidade Cesumar. Todos os direitos reservados Sistema Fictício para MAPA.
    </footer>
</body>
</html>
