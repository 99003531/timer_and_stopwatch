#include "stopwatch.h"
#include <QTimer>
#include <QDebug>

Stopwatch::Stopwatch(QObject *parent) : QObject(parent)
{
    connect(&m_timer, SIGNAL(timeout()), this, SLOT(timeout()));

    this->last_elapsed = 0;
    this->stoppedClicked = false;
}


void Stopwatch::start(){
    this->m_timer.start(10);
    this->m_watch.restart();
}

void Stopwatch::stop(){
    this->m_timer.stop();

    double elapsed = this->m_watch.elapsed() + last_elapsed;
    last_elapsed = elapsed;
   // qDebug() << last_elapsed;


    stoppedClicked = true;


}

void Stopwatch::reset(){
    m_watch.restart();
    last_elapsed = 0;
    updateDisplay(true);
    emit displayChanged();


}
void Stopwatch::toggle(bool value){

    if (value == m_fastest){
        if (value)
        {
            m_timer.setInterval(20);
        }else {
            m_timer.setInterval(10);
        }
        m_fastest = !value;
    }
}


void Stopwatch::timeout(){
    //qDebug() << last_elapsed;
    long long m_elapsed;
    if (stoppedClicked)
    {
        m_watch.restart();
        m_elapsed = m_watch.elapsed() + last_elapsed;
        stoppedClicked = false;
    }
    else {
        m_elapsed = m_watch.elapsed()+last_elapsed;
    }
    double hours = (m_elapsed/1000)/3600;
    double minutes = ((m_elapsed/1000)/60)%60;
    double seconds =  (m_elapsed/1000)%60;

    QString time = QString("0%3:0%2;%1").arg(seconds).arg(minutes).arg(hours);

    setDisplay(time);
    emit displayChanged();
}



void Stopwatch::updateDisplay(bool reset){
    if (reset)
        setDisplay("00:00;00");
}



QString Stopwatch::getdisplay(){
    return m_display;
}
void Stopwatch::setDisplay(QString value){
    m_display = value;
}

