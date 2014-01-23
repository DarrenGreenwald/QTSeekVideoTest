import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: 1024
    height: 768
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Rectangle {
        id: innerRect;
        width: 800
        height: 600
        color: "black"

        Timer {
            interval: 3000
            running: true
            repeat: true
            onTriggered: {
                console.log("Seek Timer");
                player.seek(0);
            }
        }

        MediaPlayer {
            id: player
            source: "file:///C:/Users/darren/Desktop/BBB_480_HB.mp4"
            autoPlay: true
            loops: Animation.Infinite

            onStopped: {
                console.log("Video stoppped");
            }

            onPlaying: {
                console.log("Video playing");
            }
            onPlaybackStateChanged: {
                console.log("Video playback state changed");
            }
        }

        VideoOutput {
            id: videoOutput
            source: player
            anchors.fill: parent
        }
    }
}

