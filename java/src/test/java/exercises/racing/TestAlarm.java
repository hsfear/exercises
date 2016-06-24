package exercises.racing;

import exercises.racing.tirepressure.Sensor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import java.util.Arrays;
import java.util.Collection;

@RunWith(Parameterized.class)
public class TestAlarm {
    @Parameterized.Parameters
    public static Collection<Object[]> data() {
        return Arrays.asList(new Object[][]{
                {10, 20, 0, true}, {10, 20, 9, true}, {10, 20, 10, false}, {10, 20, 20, false}, {10, 20, 21, true}
        });
    }

    private double low;
    private double high;
    private double reading;
    private boolean result;

    public TestAlarm(double low, double high, double reading, boolean result) {
        this.low = low;
        this.high = high;
        this.reading = reading;
        this.result = result;
    }

    @Test
    public void testCheck() {
        Sensor sensor = mock(Sensor.class);
        when(sensor.checkPressure()).thenReturn(reading);
        Alarm alarm = new Alarm(sensor, low, high);
        assertThat(alarm.check(), is(result));
    }
}
