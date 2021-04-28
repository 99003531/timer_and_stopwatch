import QtQuick 2.5
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import include 1.0

Item
{


    id: app
    property var ms: 0 //milliseconds
    property var s: 0  //seconds
    property var m: 0   //minutes
    property var h: 0  //hours
    property var t: 0
    property color colorClicked: "blue"





    visible: true
    //color: "#000000"
    width: 300
    height: 300
    //text: qsTr("My Timer")
    //maximumHeight: height
   // maximumWidth: width
    //minimumHeight: height
   // minimumWidth: width

    Rectangle
    {
        Timer
        {
            id:simpleTimer
            interval: 21; running: false; repeat: true
            onTriggered:
            {
                if(!(ms==0 && s==0 && m==0 && h==0)){

                     ms=ms+21
                }

                if(ms>=1000)
                {
                    if(s!=0){
                    s=s-1}

                    ms=0


                    if(s==0)
                    {
                        if(m!=0)
                        {
                        m=m-1
                        s=59
                        }
                    }
                    if(m==0 && s==0)
                    {
                        if(h!=0)
                        {
                           h=h-1
                           m+=59
                            s=59
                        }

                    }

                }
                if(m<10){
                lablTimer.text = "0"+h+":0"+m+":"+s.toString()//+":"+ms.toString()
                }
                else if(s<10){
                lablTimer.text = "0"+h+":"+m+":0"+s.toString()//+":"+ms.toString()
                }
                else if(s<10 && m<10){
                 lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
                }
                else{lablTimer.text = "0"+h+":"+m+":"+s.toString()}
            }
         }
    }


    ColumnLayout
    {
        width: 270
        height: 85
        spacing: 11.2
        anchors.verticalCenterOffset: 20
        anchors.horizontalCenterOffset: 36
        anchors.centerIn: parent
       Label
       {
           id : lablTimer
           x: -40
           width: 265
           height: 100
           color: "#ffffff"
           text: qsTr("00:00:00")
           font.pixelSize:50
           //horizontalAlignment: Text.AlignHCenter
          // verticalAlignment: Text.AlignVCenter
       }

        RowLayout
        {


            Button
            {
                id: startBut
                x: 40
                text: "Start"

                onClicked:
                {

                    buttCancel.enabled=true

                    //pause or start
                    if(simpleTimer.running==false)
                     {
                        startBut.text= qsTr("Pause")
                        simpleTimer.running =true
                     }
                    else
                    {
                        startBut.text=  qsTr("Resume")
                        simpleTimer.running =false
                    }
                }
            }

            Button
            {
                id: buttCancel
                x: 170
                y: 0
                width: 93
                enabled: false
                text: qsTr("Cancel")
                //transformOrigin: Item.Center
                onClicked:
                {


                    buttCancel.enabled = false
                    startBut.text = "Start"
                    simpleTimer.stop()
                    lablTimer.text="00:00:00"
                    ms=0
                    s=0
                    m=0
                    h=0

                }
            }


        }
    }

    Button {
        id: plusOne
        x: 90
        y: 91
        width: 42
        height: 28
        text: qsTr("1Min")

        onClicked: {
            m=m+1
            if(m>=60){
                m=0
                h=h+1
            }
            if(m<10){
            lablTimer.text = "0"+h+":0"+m+":"+s.toString()
            }
            else if(s>10 && m>10){
            lablTimer.text = "0"+h+":"+m+":"+s.toString()
            }
            else if(s<10 && m<10){
             lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
            }
            else{lablTimer.text = "0"+h+":"+m+":"+s.toString()}

        }
    }

    Button {
        id: plusFive
        x: 152
        y: 91
        width: 42
        height: 28
        text: qsTr("5Min")

        onClicked: {
            color:"light blue"
            if(m>=56)
            {
             t = (m % 5)
             m=t-5
             h=h+1
            }
            if(m<=55)
             {
               m=m+5
                if(m>=60)
                {
                    m=0
                    h=h+1
                 }
             }
            if(m<10){
            lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
            }
            else{
             lablTimer.text = "0"+h+":"+m+":0"+s.toString()
            }
        }
    }

Button {
    id: plusTen
    x: 211
    y: 91
    width: 42
    height: 28
    text: qsTr("10Min")
    onClicked: {

        if(m>=51)
        {
         t = (m % 10)
         m=t-10
         h=h+1
        }
        if(m<=50)
         {
           m=m+10
            if(m>=60)
            {
                m=0
                h=h+1
             }
         }

        if (m<10){
        lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
        }
        else{
         lablTimer.text = "0"+h+":"+m+":0"+s.toString()
        }

   }

}

Button {
    id: plusFifteen
    x: 274
    y: 91
    width: 42
    height: 28
    text: qsTr("15Min")
    onClicked: {
        if(m>=46)
        {
         t = (m % 15)
         m=t-15
         h=h+1
        }
        if(m<=45)
         {
           m=m+15
            if(m>=60)
            {
                m=0
                h=h+1
             }
         }


        if(m<10){
        lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
        }
        else{
         lablTimer.text = "0"+h+":"+m+":0"+s.toString()
        }
    }
}

Timer{
    id:timer
    interval: 500
    repeat: true
    running: true
    triggeredOnStart: true
    onTriggered: {
        currentTime.text= new Date().toLocaleString(Qt.locale(),"🔔 hh:mm:ss")
    }
}

Label {

    id: currentTime
    x: 110
    y: 300
    width: 157
    height: 28
    color: "#ffffff"
    font.pixelSize: 25



}


}

