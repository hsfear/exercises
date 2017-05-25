class DateRange(val start: MyDate, val end: MyDate): Iterable<MyDate> {
    override fun iterator(): Iterator<MyDate> {
        return object : Iterator<MyDate> {
            private var next = start

            override fun hasNext(): Boolean = next <= end

            override fun next(): MyDate {
                if (next > end) throw NoSuchElementException()
                val returnVal = next
                next = returnVal.nextDay()
                return returnVal
            }
        }
    }
}

fun iterateOverDateRange(firstDate: MyDate, secondDate: MyDate, handler: (MyDate) -> Unit) {
    for (date in firstDate..secondDate) {
        handler(date)
    }
}