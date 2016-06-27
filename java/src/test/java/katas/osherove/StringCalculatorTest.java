package katas.osherove;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.assertThat;

public class StringCalculatorTest {
    StringCalculator calculator = new StringCalculator();

    @Rule
    public final ExpectedException exception = ExpectedException.none();

    @Test
    public void testAddOfEmptyStringReturnsZero() throws Exception {
        assertThat(calculator.add(""), is(0));
    }

    @Test
    public void testAddASingleNumber() throws Exception {
        assertThat(calculator.add("1"), is(1));
    }

    @Test
    public void testAddTwoNumbers() throws Exception {
        assertThat(calculator.add("1,2"), is(3));
    }

    @Test
    public void testNewlineIsASeparator() throws Exception {
        assertThat(calculator.add("1,2\n3"), is(6));
    }

    @Test(expected = NumberFormatException.class)
    public void testThrowsNumberFormatExceptionForEmptyFields() {
        assertThat(calculator.add("1,\n"), is(1));
    }

    @Test
    public void testSpecifyDelimeter() {
        assertThat(calculator.add("//?\n1?2"), is(3));
    }

    @Test
    public void testNegativeNumber() {
        exception.expect(NumberFormatException.class);
        exception.expectMessage(startsWith("negatives not allowed"));
        exception.expectMessage(containsString("-1"));
        exception.expectMessage(not(containsString("2")));
        exception.expectMessage(containsString("-3"));
        exception.expectMessage(not(containsString("4")));
        calculator.add("-1,2,-3,4");
    }

    @Test
    public void testIgnoreNumbersMoreThanOneThousand() {
        assertThat(calculator.add("1,2,1001"), is(3));
    }

    @Test
    public void testOneThousandIsNotIgnored() {
        assertThat(calculator.add("1,2,1000"), is(1003));
    }
}
