function generateFiles() {
    const form = document.getElementById('registrationForm');
    const formData = new FormData(form);
    
    fetch('/generate_csr', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        downloadFile(data.csr, data.csr_filename, 'application/octet-stream');
        downloadFile(data.key, data.key_filename, 'application/octet-stream');
    })
    .catch(error => console.error('Error:', error));
}

function downloadFile(base64Content, filename, mimeType) {
    const byteCharacters = atob(base64Content);
    const byteNumbers = new Array(byteCharacters.length);
    for (let i = 0; i < byteCharacters.length; i++) {
        byteNumbers[i] = byteCharacters.charCodeAt(i);
    }
    const byteArray = new Uint8Array(byteNumbers);
    const blob = new Blob([byteArray], {type: mimeType});
    
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}