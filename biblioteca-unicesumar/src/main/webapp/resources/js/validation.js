function validarFormulario() {
    let formValido = true;

    // Limpar mensagens de erro anteriores
    document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
    document.querySelectorAll('.input-field').forEach(el => el.classList.remove('input-error'));

    // Validar título
    const titulo = document.getElementById('titulo').value.trim();
    if (titulo === '') {
        document.getElementById('titulo-error').textContent = 'O título do livro é obrigatório';
        document.getElementById('titulo').classList.add('input-error');
        formValido = false;
    }

    // Validar autor
    const autor = document.getElementById('autor').value.trim();
    if (autor === '') {
        document.getElementById('autor-error').textContent = 'O autor do livro é obrigatório';
        document.getElementById('autor').classList.add('input-error');
        formValido = false;
    }

    // Validar ISBN
    const isbn = document.getElementById('isbn').value.trim();
    if (isbn === '') {
        document.getElementById('isbn-error').textContent = 'O ISBN é obrigatório';
        document.getElementById('isbn').classList.add('input-error');
        formValido = false;
    }

    // Validar ano de publicação
    const anoPublicacaoInput = document.getElementById('anoPublicacao');
    const anoPublicacao = anoPublicacaoInput.value.trim();
    const anoAtual = new Date().getFullYear();
    if (anoPublicacao === '' || isNaN(anoPublicacao) || anoPublicacao < 1900 || anoPublicacao > anoAtual) {
        document.getElementById('anoPublicacao-error').textContent =
            anoPublicacao === '' ? 'O ano de publicação é obrigatório' :
            (anoPublicacao < 1900 ? 'Ano mínimo: 1900' : 'Ano máximo: ' + anoAtual);
        anoPublicacaoInput.classList.add('input-error');
        formValido = false;
    }

    if (formValido) {
        document.getElementById('livroForm').submit();
    }
}
