// admin_notifications.js
const adminSocket = io('/admin');

// Listen for admin notifications
adminSocket.on('admin_notification', function(data) {
    console.log('New admin notification:', data.message);
    // Here you would add code to update the UI with the new notification
    // For example, show a red dot, or add the notification to a dropdown menu
});
