import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import ch.epfl.stopwatch 1.0

Item {
    id: root
    visible: true
    width: 300
    height: 300
    property int displayValue: 0

    Stopwatch {
        id: stopwatch
    }

    Row {
        anchors.top: parent.top
        anchors.topMargin: 260
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 3
        Button {
            id: startButton
            width: 60
            text: "Start"
           // enabled:true//

            onClicked:{
                console.log("Start");
                pauseButton.enabled=true

                stopwatch.start();
                if(stopwatch.start===false)
                {
                    startButton.text=qsTr("Pause")
                    stopwatch.start=true
                }
                else
                {
                    startButton.text=qsTr("Resume")
                    stopwatch.start===false
                }
            }
            /*onClicked:
              {
              cancelButton.enabled=true

              if(stopwatch.start===false)
              {
              startButton.text=qsTr("Pause")
              stopwatch.start()==true
              }
              else
              {
              startButton.text=qsTr("Resume")
              stopwatch.start()==false
              }
              }
            */





        }
        Button {
            id: pauseButton
            width: 50
            text: "Pause"
            enabled:false
            onClicked: {

                stopwatch.stop();
            }
        }

        Button {
            id: cancelButton;
            width: 50
            text : "cancel"
            onClicked: {

                cancelButton.enabled=true

                stopwatch.reset();
                stopwatch.stop();
                if(stopwatch.start===false)
                {
                    startButton.text=qsTr("cancel")
                    stopwatch.start===true
                }
                else
                {
                    startButton.text=qsTr("Start")
                    stopwatch.start===false
                 }
               }

            }

       Button {
            id: markButton
            width: 50
            text: "Mark"
            onClicked: {
                root.displayValue+=1
                               console.log("Mark "+displayMessage.text+" "+stopwatch.display)
                              /* {
                               displayMessage.visible=true
                               stopwatch.stop();
                               //console.log("Mark"+stopwatch.display)

                           }*/
                               //console.log("Mark"+stopwatch.display)

                           }

            }

}
    Text {
        anchors.verticalCenterOffset: -80
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "Current time"
        font.bold: true
        font.family: "Arial"
    }
    Text {
        id: userDisplay
        x:100
        y:30
        width: 155
        height: 234
        text : stopwatch.display
        //anchors.verticalCenterOffset: -50
        anchors.horizontalCenterOffset: -20
        font.pointSize: 40
        color: "white"
        font.bold: true
        //anchors.top:parent.top
        anchors.topMargin: 120

        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.top:parent.top
    }
    Text
       {
          id:displayMessage
          anchors.bottom:parent.bottom
          text:displayValue.toString()
           /*{
           height:15
           width:20
           anchors.bottom:parent.bottom
           id:displayMessage
           visible: false
           text: "Mark"+stopwatch.display
           color:"white"
           font.pointSize:10
       }*/
       }

 }



