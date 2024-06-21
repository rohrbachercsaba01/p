function toggleDropdown() {
    var dropdown = document.getElementById("profileForm");
    if (dropdown.style.display !== 'block') {
        applyUserColor();
    }
    
    dropdown.style.display = (dropdown.style.display === 'block') ? 'none' : 'block';
}

function applyUserColor() {
    fetch('/get_user_color')
        .then(response => response.json())
        .then(data => {
            var profileForm = document.getElementById("profileForm");
            profileForm.style.backgroundColor = data.color;
        })
        .catch(error => console.error('Error fetching user color:', error));
}


function handleButtonClick(buttonName) {
    switch (buttonName) {
        case 'Button 1': // Profil
            window.location.href = '/profile';
            break;
        case 'Button 2': // Beosztás
            window.location.href = '/beosztas';
            break;
        case 'Button 3': // Postaláda
            window.location.href = '/notifications';
            break;
        case 'Button 4': // Oktatás
            window.location.href = '/oktatas';
            break;
        case 'Button 5': // Kijelentkezés - Logout
            window.location.href = '/logout';
            break;
        case 'Button 6':
            window.location.href = '/register'
            break;
        case 'Button 7':
            window.location.href = '/adminpage'
            break;
        default:
            alert('Button clicked: ' + buttonName);
            break;
    }
}

window.onclick = function(event) {
    if (!event.target.matches('.fancybutton')) {
        var dropdown = document.getElementById("profileForm");
        if (dropdown.style.display === 'block') {
            dropdown.style.display = 'none';
        }
    }
}

document.addEventListener('DOMContentLoaded', function() {

    applyUserColor();
});
