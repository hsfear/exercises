package fractions;

import org.junit.jupiter.api.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

public class AcceptanceTest {

    @Test
    public void createAFraction() {
        Fraction fraction = new Fraction(1, 2);
        assertThat(fraction.getNumerator(), is(1));
        assertThat(fraction.getDenominator(), is(2));
    }
}
