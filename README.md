# Sistema da Biblioteca - Universidade Cesumar

## Estrutura do Projeto

Este projeto segue o padrão MVC (Model-View-Controller) conforme solicitado nos requisitos:

### Model (Modelo)

- `br.com.unicesumar.bibliotecaunicesumar.model.Livro`: Representa a entidade Livro com seus atributos (título, autor, ano de publicação e ISBN).

### Controller (Controlador)

- `br.com.unicesumar.bibliotecaunicesumar.controller.LivroServlet`: Servlet principal que gerencia todas as operações relacionadas aos livros (listar, cadastrar, editar, excluir).

### View (Visualização)

- `/WEB-INF/jsp/livros/listar.jsp`: Página que exibe a lista de livros cadastrados.
- `/WEB-INF/jsp/livros/formulario.jsp`: Formulário para cadastro e edição de livros.
- `/index.jsp`: Página inicial do sistema.

### Data Access Object (DAO)

- `br.com.unicesumar.bibliotecaunicesumar.dao.LivroDAO`: Classe responsável por gerenciar o acesso aos dados dos livros (em memória nesta implementação).

## Tecnologias Utilizadas

- **Servlets**: Para controlar as requisições do usuário.
- **JSP (JavaServer Pages)**: Para construir a interface do usuário.
- **JSTL (JSP Standard Tag Library)**: Para manipulação de dados nas páginas JSP.
- **Java**: Linguagem de programação principal.

## Requisitos Funcionais Implementados

1. Cadastro de livros com os dados: Título, Autor, Ano de publicação e ISBN.
2. Listagem de livros cadastrados.
3. Exclusão de livros (por ISBN).

## Requisitos Técnicos Implementados

1. Utilização de Servlets para controlar as requisições.
2. Uso de JSP para a construção da interface do usuário.
3. Estruturação do projeto com base no padrão MVC.
4. Tratamento de erros (campos vazios, entradas inválidas de ISBN).

## Como Executar o Projeto

1. Implante o arquivo WAR em um servidor de aplicações compatível com Jakarta EE (Tomcat 10+, Glassfish, etc).
2. Acesse a aplicação através do navegador: `http://localhost:8080/biblioteca-unicesumar/`
