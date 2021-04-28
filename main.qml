import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Window {
    width: 370
    height: 370
    visible: true
    title: qsTr("Stopwatch and timer")
    color:"Black"

Loader
{
    id:loader
    anchors.fill:parent.fill
}



Row{
    anchors.top: parent.top
    anchors.topMargin: 28
    anchors.horizontalCenterOffset: -88
    anchors.horizontalCenter: parent.horizontalCenter
    spacing: 1



Item
{
    id:stopWatch
    height:300
    width:300
    anchors.top:parent.top


Button
{
    width:88
    height: 40
    text:"stopwatch"
    id:stopwatchSide
    x: 221
    y: 8
    anchors.leftMargin: 100
    onClicked: {
        //loader.left=parent.left
        loader.source="stopwatch.qml"
    }

}

Button
{
    width:84
    height: 40
    text:"timer"
    id:timerSide
    x: 131
    y: 8
    anchors.leftMargin: 300
    onClicked: {
        //loader.right=parent.right
        loader.source="mytimer.qml"


    }

}


}
/*Item {
    id: tiMer
    height:300
    width:300

    Button
    {
        width:200
        text:"timer"
        id:timerSide
         anchors.leftMargin: 300
        onClicked: {
            //loader.right=parent.right
            loader.source="timer.qml"


        }

    }


}*/

}


}
