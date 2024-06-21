document.addEventListener("DOMContentLoaded", function () {
  getscheduleFromDB();
  workdaySummary();
});

function workdaySummary() {
  console.log("betöltött");

  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/workhour_summary", true);
  xhr.setRequestHeader("Content-Type", "application/json"); // Set content type to JSON
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      var response = JSON.parse(xhr.responseText);
      var data = JSON.parse(response.data1);
      var dict2 = JSON.parse(response.dict2);
      var dict3 = JSON.parse(response.dict3);
      var dict4 = JSON.parse(response.dict4);
      //console.log(data);
      //console.log(dict2);
      //console.log(dict3);
      //console.log(dict4);

      const allLists = [data, dict2, dict3, dict4];

      const mergedData = {};

      allLists.forEach((list, index) => {
        list.forEach(entry => {
          const key = `${entry.fullName}-${entry.month}`;
          if (!mergedData[key]) {
            mergedData[key] = { fullName: entry.fullName, month: entry.month, work_hours: 0, holiday_hours_2: 0, holiday_hours_3: 0, overtime: 0 };
          }
          if (index === 0) {
            mergedData[key].work_hours = entry.total_hours;
          } else if (index === 1) {
            mergedData[key].holiday_hours_2 = entry.total_hours;
          } else if (index === 2) {
            mergedData[key].holiday_hours_3 = entry.total_hours;
          } else if (index === 3) {
            mergedData[key].overtime = entry.total_hours;
          }
        });
      });

      var resultDiv = document.getElementById("workhours");
      if (resultDiv) {
        resultDiv.innerHTML = ""; // Clear previous content
        if (Object.keys(mergedData).length > 0) {
          var tableHTML = "<table style='font-size: 15px; border-spacing: 6px;'>\
                          <thead>\
                          <tr>\
                          <th>Munkavállaló</th>\
                          <th>Hónap</th>\
                          <th>Ledolgozott óra</th>\
                          <th>Túlóra</th>\
                          <th>Szabadság óra</th>\
                          <th>Betegszabi óra</th>\
                          <th>Összes óra</th>\
                          </tr>\
                          </thead>\
                          <tbody>";
          Object.values(mergedData).forEach(function (entry) {
            const total_hours = Number(entry.work_hours) + Number(entry.holiday_hours_2) + Number(entry.holiday_hours_3) + Number(entry.overtime);
            //console.log(typeof(entry.holiday_hours_2))
            tableHTML +=
              "<tr style='border-bottom: 3px solid #007bff;'>\
                  <td style='padding: 6px;'>" + entry.fullName + "</td>\
                  <td style='padding: 6px;'>" + entry.month + "</td>\
                  <td style='padding: 6px;'>" + entry.work_hours.toString() + "</td>\
                  <td style='padding: 6px;'>" + entry.overtime.toString() + "</td>\
                  <td style='padding: 6px;'>" + entry.holiday_hours_2.toString() + "</td>\
                  <td style='padding: 6px;'>" + entry.holiday_hours_3.toString() + "</td>\
                  <td style='padding: 6px;'>" + total_hours + "</td>\
                  </tr>";
          });

          tableHTML += "</tbody></table>";
          resultDiv.innerHTML = tableHTML;
        } else {
          resultDiv.innerHTML = "No data found.";

        }
      } else {
        console.error("Element with id 'workdays' not found.");
      }
    }
  };
  xhr.send();
}


function getscheduleFromDB() {
  var dropdownName = document.getElementById("nevDropdown").value;
  var dropdownMonth = document.getElementById("monthDropdown").value;
  var savebutton = document.getElementById("saveschedule");

  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/fetch_schedule_by_name", true);
  xhr.setRequestHeader("Content-Type", "application/json"); // Set content type to JSON
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      var data = JSON.parse(xhr.responseText);
      var resultDiv = document.getElementById("workdays");
      if (resultDiv) {
        resultDiv.innerHTML = ""; // Clear previous content
        if (data.length > 0) {
          var tableHTML = "<table style='font-size: 15px; border-spacing: 6px;'><thead><tr><th>Munkavállaló</th><th>Dátum</th><th>Munkavégzés helye</th><th>Select</th></tr></thead><tbody>";
          data.forEach(function (entry) {
            //-------
            var date = new Date(entry.currDate);
            var weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            var weekdayName = weekdays[date.getDay()];
            //-------
            var formattedDate = new Date(entry.currDate).toLocaleDateString('en-CA', { year: 'numeric', month: '2-digit', day: '2-digit' }).replace(/\//g, '-');
            tableHTML += "<tr style='border-bottom: 3px solid #007bff;'><td style='padding: 7px;'>" + entry.fullName + "</td><td style='padding: 7px;'>" + formattedDate + " " + weekdayName + "</td><td style='padding: 7px;'>" + entry.workSpot + "</td><td style='padding: 7px;'><input type='checkbox' class='sickleavechb' value='" + entry.id + "' id='" + entry.userName + "'></td></tr>";
          });
          tableHTML += "</tbody></table>";
          resultDiv.innerHTML = tableHTML;
          savebutton.style.display = "block";

        } else {
          resultDiv.innerHTML = "No data found.";
          savebutton.style.display = "none";
        }
      } else {
        console.error("Element with id 'workdays' not found.");
      }
    }
  };
  xhr.send(JSON.stringify({ 'dropdown_name': dropdownName, 'dropdown_month': dropdownMonth })); // Send JSON data
}


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

//-----------------------------------------------//

document.getElementById('saveschedule').addEventListener('click', function () {
  updateFieldVisibility();
  handleSickLeave();

});

var checkbox1 = document.getElementById("betegszabi");
var checkbox2 = document.getElementById("simpledelete");
var checkbox3 = document.getElementById("simpleszabi");

var nameDD1 = document.getElementById("nevDropdown");

var schedulecheckb = document.getElementById("delfromschedule")
var schedulediv = document.getElementById("schedulediv")


function showHiddenDiv() {
  if (schedulecheckb.checked) {
    schedulediv.style.display = "block";
  }
  else {
    schedulediv.style.display = "none";
  }
}

schedulecheckb.addEventListener('change', function () {
  showHiddenDiv()
})

function updateFieldVisibility() {
  if (checkbox1.checked) {
    checkbox2.required = false;
    checkbox3.required = false;

  } else if (checkbox2.checked) {
    checkbox1.required = false;
    checkbox3.required = false;
  }
  else if (checkbox3.checked) {
    checkbox1.required = false;
    checkbox2.required = false;
  }
  else {
    checkbox1.required = true;
    checkbox2.required = true;
    checkbox3.required = true;
  }
}

checkbox1.addEventListener('change', function () {
  checkbox2.checked = false;
  checkbox3.checked = false;
  updateFieldVisibility();
});

checkbox2.addEventListener('change', function () {
  checkbox1.checked = false;
  checkbox3.checked = false;
  updateFieldVisibility();
});

checkbox3.addEventListener('change', function () {
  checkbox1.checked = false;
  checkbox2.checked = false;
  updateFieldVisibility();
});

updateFieldVisibility();

function handleSickLeave() {
  const selectedNotifications = document.querySelectorAll('.sickleavechb:checked');
  const notificationIds = Array.from(selectedNotifications).map(checkbox => checkbox.value);
  if (checkbox1.checked) {
    var xhr = new XMLHttpRequest();

    xhr.open("POST", "/upload_sick_leave", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify({ betegszabi: notificationIds }));
  }
  else if (checkbox2.checked) {
    var xhr = new XMLHttpRequest();

    xhr.open("POST", "/upload_sick_leave", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify({ simpledelete: notificationIds }));
  }
  else if (checkbox3.checked) {
    var xhr = new XMLHttpRequest();

    xhr.open("POST", "/upload_sick_leave", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify({ simpleszabi: notificationIds }));
  }
  else if (checkbox1.checked === false && checkbox2.checked === false && checkbox3.checked === false) {
    alert("Nem választottál ki egy lehetőséget sem!")
  }

}

