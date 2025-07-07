package br.com.unicesumar.bibliotecaunicesumar.controller;

import br.com.unicesumar.bibliotecaunicesumar.dao.LivroDAO;
import br.com.unicesumar.bibliotecaunicesumar.model.Livro;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.Year;
import java.util.Calendar;
import java.util.List;

@WebServlet(urlPatterns = {"/livros", "/livros/*"})
public class LivroServlet extends HttpServlet {

    private final LivroDAO livroDAO = new LivroDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "novo":
                showNovoForm(request, response);
                break;
            case "editar":
                showEditarForm(request, response);
                break;
            case "excluir":
                excluirLivro(request, response);
                break;
            default:
                listarLivros(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {
            case "salvar":
                salvarLivro(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/livros");
                break;
        }
    }

    private void listarLivros(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Livro> livros = livroDAO.listarTodos();
        request.setAttribute("livros", livros);
        var dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/livros/listar.jsp");
        dispatcher.forward(request, response);
    }

    private void showNovoForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setAttribute("livro", new Livro());
        request.setAttribute("modoEdicao", false);
        var dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/livros/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditarForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        var livro = livroDAO.buscarPorIsbn(isbn);

        if (livro != null) {
            request.setAttribute("livro", livro);
            request.setAttribute("modoEdicao", true);
            request.setAttribute("originalIsbn", isbn);
            var dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/livros/formulario.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("mensagemErro", "Livro não encontrado.");
            listarLivros(request, response);
        }
    }

    private void salvarLivro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anoStr = request.getParameter("anoPublicacao");
        String isbn = request.getParameter("isbn");
        String originalIsbn = request.getParameter("originalIsbn");

        // Validação dos campos
        boolean temErro = false;
        StringBuilder mensagemErro = new StringBuilder();

        if (titulo == null || titulo.trim().isEmpty()) {
            temErro = true;
            mensagemErro.append("O título do livro é obrigatório. ");
        }

        if (autor == null || autor.trim().isEmpty()) {
            temErro = true;
            mensagemErro.append("O autor do livro é obrigatório. ");
        }

        if (isbn == null || isbn.trim().isEmpty()) {
            temErro = true;
            mensagemErro.append("O ISBN do livro é obrigatório. ");
        }

        Integer ano = null;
        try {
            if (anoStr != null && !anoStr.trim().isEmpty()) {
                ano = Integer.parseInt(anoStr);
                int anoAtual = 2025;
                int anoMinimo = 1900;
                if (ano < anoMinimo || ano > anoAtual) {
                    temErro = true;
                    mensagemErro.append("O ano de publicação deve ser um valor entre " + anoMinimo + " e " + anoAtual + ". ");
                }
            } else {
                temErro = true;
                mensagemErro.append("O ano de publicação é obrigatório. ");
            }
        } catch (NumberFormatException e) {
            temErro = true;
            mensagemErro.append("O ano de publicação deve ser um número válido. ");
        }

        // Verificar ISBN duplicado
        if (!temErro && livroDAO.isbnExiste(isbn) && 
            (originalIsbn == null || !originalIsbn.equals(isbn))) {
            temErro = true;
            mensagemErro.append("O ISBN informado já está cadastrado em outro livro. ");
        }

        if (temErro) {
            var livro = new Livro(titulo, autor, ano, isbn);
            request.setAttribute("livro", livro);
            request.setAttribute("modoEdicao", originalIsbn != null);
            request.setAttribute("originalIsbn", originalIsbn);
            request.setAttribute("mensagemErro", mensagemErro.toString());
            var dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/livros/formulario.jsp");
            dispatcher.forward(request, response);
            return;
        }

        var livro = new Livro(titulo, autor, ano, isbn);

        try {

            if (originalIsbn != null && !originalIsbn.isEmpty()) {
                livroDAO.excluirPorIsbn(originalIsbn);
                request.setAttribute("mensagemSucesso", "Livro atualizado com sucesso!");
            } else {
                request.setAttribute("mensagemSucesso", "Livro cadastrado com sucesso!");
            }

            livroDAO.adicionar(livro);
            listarLivros(request, response);

        } catch (Exception e) {
            request.setAttribute("mensagemErro", "Ocorreu um erro ao processar o livro: " + e.getMessage());
            request.setAttribute("livro", livro);
            request.setAttribute("modoEdicao", originalIsbn != null);
            request.setAttribute("originalIsbn", originalIsbn);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/livros/formulario.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void excluirLivro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String isbn = request.getParameter("isbn");

        if (isbn != null && !isbn.isEmpty()) {
            try {
                livroDAO.excluirPorIsbn(isbn);
                request.setAttribute("mensagemSucesso", "Livro excluído com sucesso!");
            } catch (Exception e) {
                request.setAttribute("mensagemErro", "Erro ao excluir o livro: " + e.getMessage());
            }
        } else {
            request.setAttribute("mensagemErro", "ISBN não informado para exclusão.");
        }

        listarLivros(request, response);
    }
}
