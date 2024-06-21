document.addEventListener('DOMContentLoaded', function() {
    // Open and close popup functions
    function openHolidayRequestPopup() {
        document.getElementById("holidayRequestPopup").style.display = "block";
        document.getElementById("overlay").style.display = "block";
    }

    function closeHolidayRequestPopup() {
        document.getElementById("holidayRequestPopup").style.display = "none";
        document.getElementById("overlay").style.display = "none";
    }

    // Event listeners for opening and closing the popup
    document.getElementById("openHolidayRequestPopup").addEventListener('click', openHolidayRequestPopup);
    document.getElementById("closeHolidayRequestPopup").addEventListener('click', closeHolidayRequestPopup);

    // Form submission event listener
    document.querySelector("#holidayRequestPopup form").addEventListener('submit', function(event) {
        event.preventDefault();

        var formData = new FormData(event.target);
        var jsonData = Object.fromEntries(formData.entries());

        // Transform jsonData to match the backend expectations
        var submitData = {
            startDate: jsonData.holidayStartDate,
            endDate: jsonData.holidayEndDate,
            notificationType: "szabadsag"
        };

        fetch('/submit_holiday_request', {
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
                alert('Holiday request submitted successfully.');
                closeHolidayRequestPopup(); // Close the popup
            } else {
                throw new Error(data.message); // If server responds with an error status, throw an error to be caught
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
