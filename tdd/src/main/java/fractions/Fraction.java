package fractions;

import java.util.Objects;

public class Fraction {

    private int numerator;
    private int denominator;

    Fraction(int numerator, int denominator) {
        int gcd = gcd(numerator, denominator);
        this.numerator = numerator / gcd;
        this.denominator = denominator / gcd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Fraction fraction = (Fraction) o;
        return numerator == fraction.numerator &&
               denominator == fraction.denominator;
    }

    @Override
    public int hashCode() {
        return Objects.hash(numerator, denominator);
    }

    Fraction add(Fraction that) {
        int newDenominator = this.denominator * that.denominator;
        int newNumerator = (this.numerator * that.denominator) + (that.numerator * this.denominator);
        return new Fraction(newNumerator, newDenominator);
    }

    Fraction subtract(Fraction that) {
        int newDenominator = this.denominator * that.denominator;
        int newNumerator = (this.numerator * that.denominator) - (that.numerator * this.denominator);
        return new Fraction(newNumerator, newDenominator);
    }

    private static int gcd(int a, int b) /*valid for positive integers.*/ {
        // Euclid
        while(b > 0) {
            int c = a % b;
            a = b;
            b = c;
        }
        return a;
    }
}
