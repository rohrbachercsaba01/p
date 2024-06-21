const draggableForm = document.getElementById('popupForm');
  let pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  draggableForm.onmousedown = dragMouseDown;

  function dragMouseDown(e) {
    e.preventDefault();
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e.preventDefault();
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    draggableForm.style.top = (draggableForm.offsetTop - pos2) + "px";
    draggableForm.style.left = (draggableForm.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    document.onmouseup = null;
    document.onmousemove = null;
  }

  //==============================


  function setTextColorBasedOnBackground(backgroundColor) {
    // Convert the hexadecimal color to RGB
    var hexToRgb = function(hex) {
        var bigint = parseInt(hex.substring(1), 16);
        var r = (bigint >> 16) & 255;
        var g = (bigint >> 8) & 255;
        var b = bigint & 255;
        return [r, g, b];
    };

    // Calculate the brightness of the color
    var calculateBrightness = function(rgb) {
        return (0.299 * rgb[0] + 0.587 * rgb[1] + 0.114 * rgb[2]);
    };

    // Get the RGB values of the background color
    var rgb = hexToRgb(backgroundColor);

    // Calculate the brightness
    var brightness = calculateBrightness(rgb);

    // Set text color based on brightness
    var textColor = (brightness > 128) ? '#000000' : '#FFFFFF';

    // Set text color
    document.body.style.color = textColor;
}

// Example usage:
var backgroundColor = '#CD5C5C';
setTextColorBasedOnBackground(backgroundColor);