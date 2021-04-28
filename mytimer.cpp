#include "mytimer.h"
#include <QTimer>
#include <QDebug>

MyTimer::MyTimer(QObject *parent) : QObject(parent)
{
    connect(&m_timer, SIGNAL(timeout()), this, SLOT(timeout()));
    this->cancelClicked = false;
}

// ***************************** slots ***********************************
void MyTimer::start(){
    this->m_timer.start();
}



void MyTimer::cancel(){

    updateDisplay(true);
    emit displayChanged();


}

void MyTimer::updateDisplay(bool cancel){
    if (cancel)
        setDisplay("00:00:00");
}


QString MyTimer::display(){
    return m_display;
}
void MyTimer::setDisplay(QString value){
    m_display = value;
}



void MyTimer::timeout(){

    if (cancelClicked)
    {
        cancelClicked = false;
    }
    else {


    int ms = 0;
    int m = 0;
    int s = 1;
    int h = 0;

    if(!(ms==0 && s==0 && m==0 && h==0)){

         ms=ms+21;
    }

    if(ms>=1000)
    {
        s=s-1;
        ms=0;


        if(s==0)
        {
            if(m!=0)
            {
            m=m-1;
            s=60;
            }
        }
        if(m==0 && s==0)
        {
            if(h!=0)
            {
               h=h-1;
               m+=59;
                s=60;
            }

        }

    }


    QString time = QString("%3:%2.%1").arg(s).arg(m).arg(h);

    setDisplay(time);
    emit displayChanged();
}


// ***************************** slots end *********************************
}
