package katas.osherove;

import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class StringCalculator {
    private static final String DELIMETER = ",";
    private final Pattern delimeterRegex = Pattern.compile("//(.)\n(.*)$", Pattern.MULTILINE);

    public int add(String s) {
        if (s.isEmpty()) return 0;

        Matcher matcher = delimeterRegex.matcher(s);
        String delimiter = matcher.matches() ? matcher.group(1) : DELIMETER;
        String target = matcher.matches() ? matcher.group(2) : s;
        List<Integer> numbers = Arrays.asList(target.split("[" + delimiter + "\\n]", -1))
                                      .stream()
                                      .map(Integer::parseInt)
                                      .collect(Collectors.toList());
        requirePositiveNumbers(numbers);

        return numbers.stream()
                      .mapToInt(Integer::intValue)
                      .filter(i -> i <= 1000)
                      .sum();
    }

    private void requirePositiveNumbers(List<Integer> numbers) {
        List<Integer> negatives = numbers.stream().filter(i -> i < 0).collect(Collectors.toList());
        if (!negatives.isEmpty()) {
            String failures = negatives.stream().map(String::valueOf).collect(Collectors.joining(", "));
            throw new NumberFormatException("negatives not allowed: " + failures);
        }
    }
}
