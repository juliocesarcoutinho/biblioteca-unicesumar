package br.com.unicesumar.bibliotecaunicesumar.dao;

import br.com.unicesumar.bibliotecaunicesumar.model.Livro;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
public class LivroDAO {

    private static final List<Livro> acervo = new CopyOnWriteArrayList<>();

    static {
        acervo.add(new Livro("Engenharia de Software", "Ian Sommerville", 2019, "978-8543004975"));
        acervo.add(new Livro("Código Limpo", "Robert C. Martin", 2009, "978-8576082675"));
    }

    public List<Livro> listarTodos() {
        return new ArrayList<>(acervo);
    }

    public void adicionar(Livro livro) {
        acervo.add(livro);
    }

    public void atualizar(String isbnAntigo, Livro livroAtualizado) {
        excluirPorIsbn(isbnAntigo);
        adicionar(livroAtualizado);
    }

    public void excluirPorIsbn(String isbn) {
        acervo.removeIf(livro -> livro.getIsbn().equals(isbn));
    }

    public boolean isbnExiste(String isbn) {
        for (Livro livro : acervo) {
            if (livro.getIsbn().equals(isbn)) {
                return true;
            }
        }
        return false;
    }

    public Livro buscarPorIsbn(String isbn) {
        return acervo.stream()
                .filter(l -> l.getIsbn().equals(isbn))
                .findFirst()
                .orElse(null);
    }
}
