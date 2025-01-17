document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    form.addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = new FormData(form);
        const jsonData = Object.fromEntries(formData.entries());
        console.log(jsonData);

        fetch('/update_profile', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(jsonData),
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            if(data.status === 'success') {
                alert('Profile updated successfully.');
                window.location.href = '/fullbeo';
            } else {
                alert('An error occurred while updating your profile.');
            }
        })
        .catch((error) => {
            console.error('Error:', error);
            alert('An error occurred while updating your profile.');
        });
    });
});
