import scala.math.abs

class Lists() {
  def last(list: List[Int]): Int = return list.last
  def penultimate(list: List[Int]): Int = return list.takeRight(2).head
}
