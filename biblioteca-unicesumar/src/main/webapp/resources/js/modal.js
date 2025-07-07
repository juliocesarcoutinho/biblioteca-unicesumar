function openModal(isbn) {
    document.getElementById('deleteIsbn').value = isbn;
    document.getElementById('confirmModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('confirmModal').style.display = 'none';
}

