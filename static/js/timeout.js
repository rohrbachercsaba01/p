let inactivityTimeout;

function resetInactivityTimeout() {
    clearTimeout(inactivityTimeout);

    inactivityTimeout = setTimeout(function() {
        window.location.href = '/logout';
    }, 10000000);
}

resetInactivityTimeout();
document.addEventListener('mousemove', resetInactivityTimeout);
