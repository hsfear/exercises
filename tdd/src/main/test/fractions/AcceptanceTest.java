package fractions;

import org.junit.jupiter.api.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

class AcceptanceTest {

    @Test
    void fractionsCanBeEqual() {
        assertThat(new Fraction(1, 2).equals(new Fraction(1, 2)), is(true));
    }

    @Test
    void fractionsAreNormalized() {
        assertThat(new Fraction(2, 4), is(new Fraction(1, 2)));
        assertThat(new Fraction(-2, 4), is(new Fraction(-1, 2)));
        assertThat(new Fraction(-1, -2), is(new Fraction(1, 2)));
    }

    @Test
    void addAFraction() {
        assertThat(new Fraction(1, 2).add(new Fraction(1,3)), is(new Fraction(5, 6)));
    }

    @Test
    void subtractAFraction() {
        assertThat(new Fraction(1, 2).subtract(new Fraction(1,3)), is(new Fraction(1, 6)));
    }
}
