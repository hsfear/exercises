object SumOfMultiples {
  def sum(factors: Set[Int], limit: Int): Int = {
    1.until(limit).filter(i => factors.exists(factor => i % factor == 0)).sum
  }
}

