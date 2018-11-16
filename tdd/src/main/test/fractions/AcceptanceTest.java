package fractions;

import org.hamcrest.Description;
import org.hamcrest.TypeSafeMatcher;
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
        assertThat(new Fraction(2, 4), matchesFraction(new Fraction(1, 2)));
        assertThat(new Fraction(-2, 4), matchesFraction(new Fraction(-1, 2)));
        assertThat(new Fraction(-1, -2), matchesFraction(new Fraction(1, 2)));
    }

    @Test
    void allZerosAreTheSame() {
        assertThat(new Fraction(0, 3), matchesFraction(new Fraction(0, 10)));
    }

    @Test
    void convertIntegerToFraction() {
        assertThat(new Fraction(4), matchesFraction(new Fraction(4, 1)));
    }

    @Test
    void addAFraction() {
        assertThat(new Fraction(1, 2).add(new Fraction(1,3)), matchesFraction(new Fraction(5, 6)));
    }

    @Test
    void subtractAFraction() {
        assertThat(new Fraction(1, 2).subtract(new Fraction(1,3)), matchesFraction(new Fraction(1, 6)));
    }

    static TypeSafeMatcher<Fraction> matchesFraction(final Fraction expected) {
        return new TypeSafeMatcher<Fraction>() {
            @Override
            protected boolean matchesSafely(Fraction actual) {
                return actual.getNumerator() == expected.getNumerator()
                    && actual.getDenominator() == expected.getDenominator();
            }

            @Override
            public void describeTo(Description description) {
                description.appendValue(expected);
            }

            @Override
            protected void describeMismatchSafely(Fraction item, Description mismatchDescription) {
                mismatchDescription.appendText("was ").appendValue(item);
            }
        };
    }
}
