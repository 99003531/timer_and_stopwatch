#ifndef MYTIMER_H
#define MYTIMER_H

#include <QTimer>


class MyTimer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString display READ display WRITE setDisplay NOTIFY displayChanged)

public:
    explicit MyTimer(QObject *parent = nullptr);

signals:
    void displayChanged();
public slots:

    void start();
    void cancel();
    void timeout();

private:
    bool cancelClicked;
    QTimer m_timer;
    QString m_display;

    void updateDisplay(bool reset = false);
    QString display();
    void setDisplay(QString value);
};



#endif // MYTIMER_H
