object Leap {
  def leapYear(year: Int): Boolean = {
    def isDivisibleBy400: Boolean = year % 400 == 0
    def isDivisibleBy100: Boolean = year % 100 == 0
    def isDivisibleBy4: Boolean = year % 4 == 0
    isDivisibleBy400 || (isDivisibleBy4 && !isDivisibleBy100)
  }
}
