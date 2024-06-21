document.addEventListener('DOMContentLoaded', function() {
    // Open and close popup functions
    function openScheduleChangeRequestPopup() {
        document.getElementById("scheduleChangeRequestPopup").style.display = "block";
        document.getElementById("overlay").style.display = "block";
    }
  
    function closeScheduleChangeRequestPopup() {
        document.getElementById("scheduleChangeRequestPopup").style.display = "none";
        document.getElementById("overlay").style.display = "none";
    }
  
    // Event listeners for opening and closing the popup
    document.getElementById("openScheduleChangeRequest").addEventListener('click', openScheduleChangeRequestPopup);
    document.getElementById("closeScheduleChangeRequestPopup").addEventListener('click', closeScheduleChangeRequestPopup);
  
    // Form submission event listener
    document.querySelector("#scheduleChangeRequestPopup form").addEventListener('submit', function(event) {
        event.preventDefault();
        var formData = new FormData(event.target);
        var jsonData = Object.fromEntries(formData.entries());

        var submitData = {
            date: jsonData.changeRequestDate,
            startHour: jsonData.changeRequestStartHour,
            endHour: jsonData.changeRequestEndHour,
            notificationType: "beosztas_modositas"
        };
        
        fetch('/requestScheduleChange', { // Replace with your Flask endpoint
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(submitData),
        })
        .then(response => {
            if (!response.ok) {
                throw response; // Throw response so that we can catch it and display the error message
            }
            return response.json();
        })
        .then(data => {
            if(data.status === 'success') {
                alert('Beosztás módosítási kérés sikeresen benyújtva.');
                closeScheduleChangeRequestPopup(); // Javított függvényhívás
            } else {
                throw new Error(data.message); // Ha a szerver hibás választ ad, dobjon egy hibát
            }
        })
        .catch(errorResponse => {
            // If errorResponse is an instance of Response, it's a server response that we need to parse to get the message
            if (errorResponse instanceof Response) {
                errorResponse.json().then(errorData => {
                    alert('An error occurred while submitting your holiday request: ' + errorData.message);
                });
            } else {
                // For any other type of errors
                console.error('Error:', errorResponse);
                alert('An error occurred while submitting your holiday request.');
            }
        });
    });
  });
  