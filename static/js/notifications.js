function fetchNotifications() {
    fetch('/get_notifications')
        .then(response => response.json())
        .then(notifications => {
            // Extract unique senderIds from notifications
            const senderIds = [...new Set(notifications.map(notification => notification.senderId))];

            // Fetch usernames for each senderId
            const usernamePromises = senderIds.map(id =>
                fetch(`/get_username_by_id/${id}`).then(response => response.json())
            );

            // Wait for all usernames to be fetched
            Promise.all(usernamePromises).then(usernames => {
                // Map senderIds to usernames
                const idToUsernameMap = usernames.reduce((acc, current) => {
                    acc[current.id] = current.name; // Assuming the response has id and name
                    return acc;
                }, {});

                // Now we have a map of senderId to usernames, we can group notifications by username
                const groupedNotifications = notifications.reduce((acc, notification) => {
                    const userName = idToUsernameMap[notification.senderId];
                    if (!acc[userName]) {
                        acc[userName] = [];
                    }
                    acc[userName].push(notification);
                    return acc;
                }, {});

                displayGroupedNotifications(groupedNotifications);
            });
        })
        .catch(error => console.error('Error:', error));
}


function displayGroupedNotifications(groupedNotifications) {
    const container = document.getElementById('notifications');
    container.innerHTML = ''; // Clear existing notifications

    Object.entries(groupedNotifications).forEach(([userName, notifications]) => {
        const groupDiv = document.createElement('div');
        groupDiv.className = 'notification-group';

        const nameHeader = document.createElement('h3');
        const nameHeaderCheckbox = document.createElement('input');
        nameHeaderCheckbox.type = 'checkbox';
        nameHeaderCheckbox.id = 'masterCheckbox'
        nameHeader.textContent = userName;
        groupDiv.appendChild(nameHeader);
        groupDiv.appendChild(nameHeaderCheckbox);

        notifications.forEach(notification => {
            const notificationDiv = document.createElement('div');
            notificationDiv.className = 'notification-div'; // Apply CSS class for styling

            const messageP = document.createElement('p');
            messageP.className = 'notification-message'; // Apply CSS class for styling
            messageP.textContent = notification.message;

            const checkboxes = document.createElement('input');
            checkboxes.type = 'checkbox';
            checkboxes.className = 'targetCheckbox';
            checkboxes.value = notification.id;

            notificationDiv.appendChild(messageP);
            notificationDiv.appendChild(checkboxes);

            groupDiv.appendChild(notificationDiv);
        });

        container.appendChild(groupDiv);

        const masterCheckbox = document.getElementById('masterCheckbox');
        const targetCheckboxes = document.querySelectorAll('.targetCheckbox');

        function toggleCheckboxes() {
            targetCheckboxes.forEach(checkbox => {
                checkbox.checked = masterCheckbox.checked;
            });
        }
        masterCheckbox.addEventListener('click', toggleCheckboxes);

    });

}

document.addEventListener('DOMContentLoaded', fetchNotifications);

document.getElementById('approveSelected').addEventListener('click', function () {
    handleBatchAction(true);
});

document.getElementById('declineSelected').addEventListener('click', function () {
    handleBatchAction(false);
});

function handleBatchAction(isApproved) {
    console.log(isApproved)
    const selectedNotifications = document.querySelectorAll('.targetCheckbox:checked');
    const notificationIds = Array.from(selectedNotifications).map(checkbox => checkbox.value);

    fetch('/handle_batch_notification', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ notificationIds, isApproved }),
    })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                alert('Notifications updated successfully');
                fetchNotifications(); // Refresh notifications list
            } else {
                alert('Failed to update notifications');
            }
        })
        .catch(error => console.error('Error:', error));
}
