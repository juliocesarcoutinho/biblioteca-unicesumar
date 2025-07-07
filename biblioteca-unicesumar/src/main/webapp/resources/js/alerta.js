// Script para animação de alerta de sucesso/erro
window.addEventListener('DOMContentLoaded', function() {
    var alerta = document.getElementById('alertaSucesso');
    var alertaErro = document.getElementById('alertaErro');
    function showAlert(element) {
        if(element) {
            setTimeout(function() {
                element.classList.add('show');
            }, 50); // pequeno delay para garantir transição
        }
    }
    function fadeOutAlert(element) {
        if(element) {
            element.classList.remove('show');
            element.classList.add('fade-out');
            setTimeout(function() {
                element.style.display = 'none';
            }, 700);
        }
    }
    if(alerta) {
        showAlert(alerta);
        setTimeout(function() {
            fadeOutAlert(alerta);
        }, 5000);
    }
    if(alertaErro) {
        showAlert(alertaErro);
        setTimeout(function() {
            fadeOutAlert(alertaErro);
        }, 5000);
    }
});

