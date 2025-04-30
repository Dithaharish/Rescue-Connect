function sendAlert() {
    const email = document.getElementById('alertEmail').value;
    const message = document.getElementById('alertMessage').value;

    fetch('php/send_alert.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `email=${encodeURIComponent(email)}&message=${encodeURIComponent(message)}`
    })
    .then(response => response.text())
    .then(result => alert(result))
    .catch(error => console.error('Error:', error));
}
