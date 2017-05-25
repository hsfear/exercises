data class MyDate(val year: Int, val month: Int, val dayOfMonth: Int) : Comparable<MyDate> {
    override fun compareTo(other: MyDate): Int {
        return if (year != other.year) year.compareTo(other.year)
        else if (month != other.month) month.compareTo(other.month)
        else dayOfMonth.compareTo(other.dayOfMonth)
    }
}

fun compare(date1: MyDate, date2: MyDate) = date1 < date2