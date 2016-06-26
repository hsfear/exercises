package katas.racing;

import katas.racing.tirepressure.Sensor;

public class Alarm {
    private Sensor sensor;
    private double low;
    private double high;

    public Alarm(Sensor sensor, double low, double high) {
        this.sensor = sensor;
        this.low = low;
        this.high = high;
    }

    public boolean check() {
        double current = sensor.checkPressure();
        return current < low || current > high;
    }
}
