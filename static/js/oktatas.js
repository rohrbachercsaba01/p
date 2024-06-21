document.addEventListener('DOMContentLoaded', function () {
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    locale: 'hu',
    firstDay: 1,
    navLinks: true,
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    events: function(fetchInfo, successCallback, failureCallback) {
      fetch('/get_training')
      .then(response => response.json())
      .then(dataDict => {
          let formattedEvents = [];
          Object.keys(dataDict).forEach(username => {
              dataDict[username].forEach(trainingSession => {
                  formattedEvents.push({
                      title: `${trainingSession.eventName} - ${username}`, // Format title
                      start: `${trainingSession.date}T${trainingSession.startHour}`,
                      end: `${trainingSession.date}T${trainingSession.endHour}`,
                      color: trainingSession.color,
                      extendedProps: {
                          workSpot: trainingSession.workSpot // If you have a workSpot or equivalent
                      }
                  });
              });
          });
          successCallback(formattedEvents);
      })
      .catch(error => {
          console.error('Error fetching training sessions:', error);
          failureCallback(error);
      });
  },
    eventContent: function(arg) { // Custom function to generate event content
      var elem = document.createElement('div');
      var startTime = arg.event.start.toLocaleTimeString('hu-HU').slice(0, -3);
      var endTime = arg.event.end.toLocaleTimeString('hu-HU').slice(0, -3);
      var titleParts = arg.event.title.split(' - '); // Split the title by ' - '
      elem.style.backgroundColor = arg.event.backgroundColor; // Use arg.event.backgroundColor for background color
      elem.style.padding = '13px'; // Add padding for better visual appearance
      elem.style.borderRadius = '5px'; // Optional: Adds rounded corners for a nicer look
      elem.style.color = arg.event.color;
      elem.innerHTML = `
          <div><strong>${titleParts[0]}</strong></div>
          <div>${titleParts[1]}</div> <!-- Display the second part on a new line -->
          <div>${startTime} - ${endTime}</div>
      `;
      return { domNodes: [elem] };
    },
    eventClick: function (info) {
      var correventId = info.event.id;
      var start = info.event.start;
      var FormattedStart = start.toISOString().split('T')[0] + ' ' + start.toTimeString().split(' ')[0];
      var date = FormattedStart.split(' ')[0];
      var startHour = FormattedStart.split(' ')[1];
      var name = info.event.title.split(' - ')[1];
      var scheduleToDelete = { startHour: startHour, name: name, date: date };
      correvent = calendar.getEventById(correventId);
      correvent.remove();
      fetch('/delete_training', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
          },
          body: JSON.stringify(scheduleToDelete),
      })
      .then(response => {
          console.log('Data sent to server successfully!');
      })
      .catch(error => {
          console.error('Error sending data to server:', error);
      });
    }
  });
  calendar.render();

  fetch('/get_namelist')
  .then(response => response.json())
  .then(dataArray => {
    const dropdown = document.getElementById('nevDropdown');
    dataArray.forEach(data => {
      Object.keys(data).forEach(username => {
        const fullName = data[username];
        const option = document.createElement('option');
        option.value = username;
        option.textContent = fullName;
        dropdown.appendChild(option);
      });
    });
  })
  .catch(error => console.error('Error fetching user data:', error));

  var usernameInput = document.getElementById('nevDropdown');
  var eventNameInput = document.getElementById('oktatas');
  var openPopupButton = document.getElementById('openPopup');

  function toggleButtonBasedOnInput() {
    if (usernameInput.value.trim() !== '' && eventNameInput.value.trim() !== '') {
      openPopupButton.disabled = false;
    } else {
      openPopupButton.disabled = true;
    }
  }


  usernameInput.addEventListener('keyup', toggleButtonBasedOnInput);
  eventNameInput.addEventListener('keyup', toggleButtonBasedOnInput);

  toggleButtonBasedOnInput();

  document.getElementById("openPopup").onclick = function () {
    document.getElementById("popupForm").style.display = "block";
  };

  document.getElementById("closePopup").onclick = function () {
    document.getElementById("popupForm").style.display = "none";
  };

  var checkbox1 = document.getElementById("naponta");
  var additionalFields1 = document.getElementById("VadditionalFields1");
  var inputs1 = additionalFields1.querySelectorAll('input');

  function updateFieldVisibility() {
    additionalFields1.style.display = checkbox1.checked ? "block" : "none";
    inputs1.forEach(input => input.required = checkbox1.checked);
  }

  checkbox1.addEventListener('change', updateFieldVisibility);
  updateFieldVisibility();

  function GetUserColor() {
    var user_color = document.getElementById('UserColor').value;
    return user_color;
  };

  document.getElementById("okGomb").addEventListener('click', function (event) {
    event.preventDefault();

    var eventName = document.getElementById("oktatas").value;
    var username = document.getElementById('nevDropdown').value;
    var date = document.getElementById("datum1").value;
    var startHour = document.getElementById("kezdoOra1").value;
    var endHour = document.getElementById("vegOra1").value;

    // Add event to the calendar
    calendar.addEvent({
      title: eventName + ' - ' + username,
      start: date + 'T' + startHour,
      end: date + 'T' + endHour,
      color: GetUserColor(),
      allDay: false
    });

    // Prepare data to be saved
    var trainingJson = {
      username: username,
      eventname: eventName,
      training: [{
        date: date,
        startHour: startHour,
        endHour: endHour,
      }],
    };

    // Save the new event to the server
    fetch('/save_training', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(trainingJson),
    })
      .then(response => response.json())
      .then(data => {
        console.log('Success:', data);
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  });
});
