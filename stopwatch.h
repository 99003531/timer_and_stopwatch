#ifndef STOPWATCH_H
#define STOPWATCH_H

#include <QElapsedTimer>
#include <QTimer>


class Stopwatch : public QObject
{
    Q_OBJECT


    Q_PROPERTY(QString display READ getdisplay WRITE setDisplay NOTIFY displayChanged)

public:
    explicit Stopwatch(QObject *parent = nullptr);
    //Stopwatch();
signals:

    void displayChanged();
public slots:

    void start();
    void stop();
    void reset();
    void toggle(bool value);
    void timeout();

private:
    bool stoppedClicked;
    QTimer m_timer;
    QElapsedTimer m_watch;
    QString m_display;

    double last_elapsed;
    bool m_fastest;

    void updateDisplay(bool reset = false);

    QString getdisplay();
    void setDisplay(QString value);
};
#endif // STOPWATCH_H
