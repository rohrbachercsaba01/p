console.log('xml.js loaded');
var player;
function onYouTubeIframeAPIReady() {
    console.log('onYouTubeIframeAPIReady');
    player = new YT.Player('videoPlayer', {
        height: '360',
        width: '640',
        videoId: 'xvFZjo5PgG0', // Replace this with your video ID
        events: {
            'onReady': onPlayerReady,
        }
    });
}

function onPlayerReady(event) {
    console.log('onPlayerReady');
    var playButton = document.getElementById("playButton");
    playButton.addEventListener("click", function() {
        playButton.style.display = 'none'; // Hide play button
        document.getElementById('videoPlayer').style.display = 'block'; // Show the player
        player.playVideo(); // Play the video
    });
}
