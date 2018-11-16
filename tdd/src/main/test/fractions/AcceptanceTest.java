package fractions;

import org.junit.jupiter.api.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

public class AcceptanceTest {

    @Test
    public void createAFraction() {
        Fraction fraction = new Fraction(1, 2);
        assertThat(fraction, allOf(hasProperty("numerator", is(1)), hasProperty("denominator", is(2))));
    }

    @Test
    public void addAFraction() {
        Fraction result = new Fraction(1, 2).add(new Fraction(1,3));
        assertThat(result, allOf(hasProperty("numerator", is(5)), hasProperty("denominator", is(6))));
    }

    @Test
    public void subtractAFraction() {
        Fraction result = new Fraction(1, 2).subtract(new Fraction(1,3));
        assertThat(result, allOf(hasProperty("numerator", is(1)), hasProperty("denominator", is(6))));
    }
}
