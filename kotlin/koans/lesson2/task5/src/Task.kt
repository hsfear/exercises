import TimeInterval.*

data class MyDate(val year: Int, val month: Int, val dayOfMonth: Int)

enum class TimeInterval { DAY, WEEK, YEAR }

data class TimeIntervalCollection(val timeInterval: TimeInterval, val number: Int)
operator fun TimeInterval.times(number: Int): TimeIntervalCollection = TimeIntervalCollection(this, number)

operator fun MyDate.plus(timeInterval: TimeInterval): MyDate = this.addTimeIntervals(timeInterval, 1)
operator fun MyDate.plus(timeIntervalCollection: TimeIntervalCollection): MyDate = this.addTimeIntervals(timeIntervalCollection.timeInterval, timeIntervalCollection.number)

fun task1(today: MyDate): MyDate {
    return today + YEAR + WEEK
}

fun task2(today: MyDate): MyDate {
    return today + YEAR * 2 + WEEK * 3 + DAY * 5
}