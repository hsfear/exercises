package fractions;

import java.util.Objects;

import static java.lang.Math.abs;

public class Fraction {

    private int numerator;
    private int denominator;

    Fraction(int numerator, int denominator) {
        if (numerator == 0) {
            this.numerator = 0;
            this.denominator = 1;
            return;
        }
        if (numerator < 0 && denominator < 0) {
            numerator = abs(numerator);
            denominator = abs(denominator);
        }
        int gcd = gcd(abs(numerator), abs(denominator));
        this.numerator = numerator / gcd;
        this.denominator = denominator / gcd;
    }

    Fraction(int integer) {
        this(integer, 1);
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
        assert(a > 0 && b > 0);
        
        // Euclid
        while(b > 0) {
            int c = a % b;
            a = b;
            b = c;
        }
        return a;
    }
}
