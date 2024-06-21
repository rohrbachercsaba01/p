document.addEventListener('DOMContentLoaded', function () {

    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'hu',
        firstDay: 1,
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        events: function (fetchInfo, successCallback, failureCallback) {
            fetch('/freedom_calendar')
                .then(response => response.json())
                .then(data => {
                    console.log(data)
                    let formattedEvents = data.map(event => ({
                        title: event.title + '-' + event.szabadsagType, // Keep this for compatibility
                        date: event.start,
                        color: event.color,
                        extendedProps: {
                            szabadsagType: event.szabadsagType
                        },
                        allDay: true
                    }));
                    successCallback(formattedEvents);
                })
                .catch(error => {
                    console.error('Error fetching all freedom days:', error);
                    failureCallback(error);
                });
            //calendarEl.style.width = '90%';
        },
        eventContent: function (arg) { // Custom function to generate event content
            var elem = document.createElement('div');

            elem.style.backgroundColor = arg.event.backgroundColor; // Use arg.event.backgroundColor for background color
            elem.style.padding = '12px'; // Add padding for better visual appearance
            elem.style.borderRadius = '5px'; // Optional: Adds rounded corners for a nicer look
            elem.style.color = arg.event.color;
            elem.innerHTML = `
              <div><strong>${arg.event.title.split('-')[0]}</strong></div>
              <div>${arg.event.extendedProps.szabadsagType}</div>
          `;
            return { domNodes: [elem] };
        }
    });
    calendar.render();

});
