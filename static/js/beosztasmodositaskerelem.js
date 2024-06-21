document.addEventListener('DOMContentLoaded', function() {
  // Open and close popup functions
  function openScheduleChangeRequestPopupp() {
      document.getElementById("scheduleChangeRequestPopup").style.display = "block";
      document.getElementById("overlay").style.display = "block";
  }

  function closeScheduleChangeRequestPopupp() {
      document.getElementById("scheduleChangeRequestPopup").style.display = "none";
      document.getElementById("overlay").style.display = "none";
  }

  // Event listeners for opening and closing the popup
  document.getElementById("openScheduleChangeRequest").addEventListener('click', openScheduleChangeRequestPopupp);
  document.getElementById("closeHolidayRequestPopup").addEventListener('click', closeScheduleChangeRequestPopupp);

  // Form submission event listener
  document.querySelector("#scheduleChangeRequestPopup form").addEventListener('submit', function(event) {
      event.preventDefault();

  });
});