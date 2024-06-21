document.addEventListener('DOMContentLoaded', function () {
  // Initialize Calendar
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    navLinks: true,
    locale: 'hu',
    firstDay: 1,
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    editable: true,
    droppable: true,
    eventClick: function (info) {
      var correventId = info.event.id;
      var start = info.event.start;
      var FormattedStart = start.toISOString().split('T')[0] + ' ' + start.toTimeString().split(' ')[0];
      var date = FormattedStart.split(' ')[0];
      var startHour = FormattedStart.split(' ')[1];
      var name = info.event.groupId;
      console.log(name);

      var scheduleToDelete = { startHour: startHour, name: name, date: date };
      correvent = calendar.getEventById(correventId);
      correvent.remove();
      console.log('fetch is jere')
      fetch('/delete_schedule', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(scheduleToDelete),
      })
        .then(response => {
          // Handle response from server if needed
          console.log('Data sent to server successfully!');
        })
        .catch(error => {
          // Handle error if request fails
          console.error('Error sending data to server:', error);
        });
      location.reload();

    }

  });
  calendar.render();

  fetch('/get_schedule')
    .then(response => response.json())
    .then(data => {
      Object.keys(data).forEach(username => {
        data[username].forEach(event => {
          let workSpot = `${event.workSpot}`;
          let eventStartTime = new Date(`${event.date}T${event.startHour}`);
          let eventEndTime = new Date(`${event.date}T${event.endHour}`);
          let color = event.color;

          calendar.addEvent({
            id: username + eventStartTime,
            groupId: username,
            title: username + '-' + workSpot,
            start: eventStartTime,
            end: eventEndTime,
            color: color,
          });
        });
      });
      calendar.render(); // Re-render the calendar to ensure events are displayed
    })
    .catch(error => console.error('Error fetching schedule:', error));

  // Popup open and close handlers
  document.getElementById("openPopup").onclick = function () {
    document.getElementById("popupForm").style.display = "block";
  };

  document.getElementById("closePopup").onclick = function () {
    document.getElementById("popupForm").style.display = "none";
  };

  function removeLeadingZero(timeStr) {
    const [hour, minute] = timeStr.split(':');
    return `${parseInt(hour)}:${minute}`;
  }


  // Checkbox visibility logic
  var checkbox1 = document.getElementById("dayByDay");
  var additionalFields1 = document.getElementById("additionalFields1");
  var inputs1 = additionalFields1.querySelectorAll('input');

  var checkbox2 = document.getElementById("fullMonth");
  var additionalFields2 = document.getElementById("additionalFields2");
  var inputs2 = additionalFields2.querySelectorAll('input');

  document.getElementById('downloadAttendance').addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent form submission

    // Submit the form asynchronously
    fetch('/get_attendance', {
      method: 'POST',
      body: new FormData(this)
    })
      .then(response => response.text())
      .then(filePath => {
        // Construct the download URL
        const downloadUrl = window.location.origin + '/' + filePath;

        // Create an invisible anchor element
        const a = document.createElement('a');
        a.style.display = 'none';
        a.href = downloadUrl;
        a.download = 'filled_template.docx'; // Set the filename
        document.body.appendChild(a);

        // Trigger the download
        a.click();

        // Remove the anchor element
        document.body.removeChild(a);
      })
      .catch(error => console.error('Error:', error));
  });

  function updateFieldVisibility() {
    if (checkbox1.checked) {
      additionalFields1.style.display = "block";
      inputs1.forEach(input => input.required = true);

      checkbox2.required = false;
      additionalFields2.style.display = "none";
      inputs2.forEach(input => input.required = false);
    } else if (checkbox2.checked) {
      additionalFields2.style.display = "block";
      inputs2.forEach(input => input.required = true);

      checkbox1.required = false;
      additionalFields1.style.display = "none";
      inputs1.forEach(input => input.required = false);
    } else {
      additionalFields1.style.display = "none";
      additionalFields2.style.display = "none";
      inputs1.forEach(input => input.required = false);
      inputs2.forEach(input => input.required = false);

      checkbox1.required = true;
      checkbox2.required = true;
    }
  }

  checkbox1.addEventListener('change', function () {
    checkbox2.checked = false;
    updateFieldVisibility();
  });

  checkbox2.addEventListener('change', function () {
    checkbox1.checked = false;
    updateFieldVisibility();
  });

  updateFieldVisibility();

  function GetUserColor() {
    // Retrieve the username value from the hidden input field
    return user_color;

  };
  async function checkHoliday(date) {

    const response = await fetch('/is_holiday', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ date: date })
    });

    const data = await response.json();
    res = data.is_holiday
    if (data.is_holiday === 0) {
      return '0';
    } else {
      return '1';
    }


  }
  // Adding events to calendar
  var okButton = document.getElementById("okButton");
  okButton.addEventListener('click', function (event) {
    event.preventDefault();
    var username = document.getElementById("username").value;
    var scheduleEntries = [];

    if (document.getElementById("dayByDay").checked) {
      var date = document.getElementById("date1").value;
      var startHour = document.getElementById("startHour1").value;
      var endHour = document.getElementById("endHour1").value;
      var workSpot = document.getElementById("workSpot1").value;
      var events = calendar.getEvents();
      var eventExists = events.some(function (event) {
        return event.start.toISOString().split('T')[0] === date;
      });

      // Adding event to calendar
      if (eventExists === false) {
        dateN = new Date(date);
        var dayOfWeek1 = dateN.toLocaleDateString('hu-HU', { weekday: 'short' });
        if (dayOfWeek1 === 'Szo' || dayOfWeek1 === 'V') {

          calendar.addEvent({
            id: username + date + '18:00',
            groupId: username,
            title: username + "\n" + "homeoffice", //Date(`${event.date}T${event.endHour}`)
            start: date + 'T' + '18:00',
            end: date + 'T' + '19:00',
            color: "red",
            allDay: false

          });
          // Pushing the entry into scheduleEntries array
          scheduleEntries.push({ date: date, startHour: '18:00', endHour: '19:00', workSpot: 'homeoffice' , holidaycrack: 'yes'});
        }
        else {
          calendar.addEvent({
            id: username + date + startHour,
            groupId: username,
            title: username + "\n" + workSpot,
            start: date + 'T' + startHour,
            end: date + 'T' + endHour,
            color: "red",
            allDay: false

          });
          // Pushing the entry into scheduleEntries array
          console.log(username + date + startHour)
          scheduleEntries.push({ date: date, startHour: startHour, endHour: endHour, workSpot: workSpot, holidaycrack: 'yes'});
        }
      }
      else {
        alert("Két beosztást próbáltál feltölteni egy napra!")
      }
    } else if (document.getElementById("fullMonth").checked) {
      var startDate = document.getElementById("startDate2").value;
      var endDate = document.getElementById("endDate2").value;
      var startHour = document.getElementById("startHour2").value;
      var endHour = document.getElementById("endHour2").value;

      var current = new Date(startDate);
      var end = new Date(endDate);
      var scheduleEntries = [];

      while (current <= end) {
        var events = calendar.getEvents();
        var eventExists = events.some(function (event) {
          return event.start.toISOString().split('T')[0] === current.toISOString().split('T')[0];
        });
        if (eventExists === false) {
          var dayOfWeek = current.toLocaleDateString('hu-HU', { weekday: 'short' });
          var workSpot = "";
          var currentFormatted = current.toISOString().split('T')[0]
          //-----------------------------------------

          //-----------------------------------------
          if (dayOfWeek === 'K' || dayOfWeek === 'Cs') {
            workSpot = "iroda";
          } else if (dayOfWeek === 'H' || dayOfWeek === 'Sze' || dayOfWeek === 'P') {
            workSpot = "homeoffice";
          } else if (dayOfWeek === 'Szo' || dayOfWeek === 'V') {
            workSpot = "Dontwork";
          }
          if (workSpot !== "Dontwork") {

            console.log("Adding event for", dayOfWeek, current.toISOString());
            calendar.addEvent({
              id: username + current.toISOString().split('T')[0] + startHour,
              title: username + " " + workSpot,
              start: current.toISOString().split('T')[0] + 'T' + startHour,
              end: current.toISOString().split('T')[0] + 'T' + endHour,
              color: "red",
              allDay: false
            });
            scheduleEntries.push({
              date: current.toISOString().split('T')[0],
              startHour: startHour,
              endHour: endHour,
              workSpot: workSpot,
              holidaycrack: 'no'
            });
          }
          else {
            console.log("Ünnepnap vagy hétvége")
          }

        }
        else {
          console.log("Két beosztást próbáltál feltölteni egy napra!")
        }

        current.setDate(current.getDate() + 1);


      }

      console.log(scheduleEntries);
      // Here, you would typically send 'scheduleEntries' to the server
    }

    // Creating the JSON object
    var scheduleJson = {
      username: username,
      schedule: scheduleEntries
    };

    // Logging the JSON object to the console
    fetch('/save_schedule', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(scheduleJson),
    })
      .then(response => response.json())
      .then(data => {
        console.log('Success:', data);
      })
      .catch((error) => {
        console.error('Error:', error);
      });
    location.reload();
  });

});
