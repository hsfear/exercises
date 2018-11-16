package fractions;

public class Fraction {

    private int numerator;
    private int denominator;

    public Fraction(int numerator, int denominator) {
        this.numerator = numerator;
        this.denominator = denominator;
    }

    public int getNumerator() {
        return numerator;
    }

    public int getDenominator() {
        return denominator;
    }

    public Fraction add(Fraction that) {
        int newDenominator = this.denominator * that.denominator;
        int newNumerator = (this.numerator * that.denominator) + (that.numerator * this.denominator);
        return new Fraction(newNumerator, newDenominator);
    }
}
