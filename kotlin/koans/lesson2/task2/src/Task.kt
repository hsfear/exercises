class DateRange(val start: MyDate, val endInclusive: MyDate) {
    operator fun contains(other: MyDate): Boolean {
        return other in start..endInclusive
    }
}

fun checkInRange(date: MyDate, first: MyDate, last: MyDate): Boolean {
    return date in DateRange(first, last)
}