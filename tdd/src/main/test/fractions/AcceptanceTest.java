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

    @Test
    public void addAFraction() {
        Fraction result = new Fraction(1, 2).add(new Fraction(1,3));
        assertThat(result.getNumerator(), is(5));
        assertThat(result.getDenominator(), is(6));
    }
}
