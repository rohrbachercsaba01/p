document.getElementById('downloadFullAttendance').addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent form submission

    // Submit the form asynchronously
    fetch('/get_full_attendance', {
        method: 'POST',
        body: new FormData(this)
    })
        .then(response => response.text())
        .then(filePath => {
            console.log(filePath)
            // Construct the download URL
            const downloadUrl = window.location.origin + '/' + filePath;

            // Create an invisible anchor element
            const a = document.createElement('a');
            a.style.display = 'none';
            a.href = downloadUrl;
            a.download = 'jelenleti.xlsx'; // Set the filename
            document.body.appendChild(a);

            // Trigger the download
            a.click();

            // Remove the anchor element
            document.body.removeChild(a);
        })
        .catch(error => console.error('Error:', error));
  });
