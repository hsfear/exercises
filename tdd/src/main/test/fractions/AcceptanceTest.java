package fractions;

import org.junit.jupiter.api.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

public class AcceptanceTest {

    @Test
    public void fractionsCanBeEqual() {
        assertThat(new Fraction(1, 2).equals(new Fraction(1, 2)), is(true));
    }

    @Test
    public void addAFraction() {
        assertThat(new Fraction(1, 2).add(new Fraction(1,3)), is(new Fraction(5, 6)));
    }

    @Test
    public void subtractAFraction() {
        assertThat(new Fraction(1, 2).subtract(new Fraction(1,3)), is(new Fraction(1, 6)));
    }
}
