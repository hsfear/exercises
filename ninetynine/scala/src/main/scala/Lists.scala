import scala.math.abs

class Lists() {
  def last(list: List[Int]): Int = 
    list match {
      case last :: Nil => last
      case _ :: _ => last(list.tail)
      case _ => throw new NoSuchElementException()
    }

  def penultimate(list: List[Int]): Int =
    list match {
      case head :: _ :: Nil => head
      case _ :: _ :: tail  => penultimate(list.tail)
      case _ => throw new NoSuchElementException()
    }

  def kth(list: List[Int], k: Int): Int = {
    require(k > 0)
    k match {
      case 1 => list.head
      case _ => kth(list.tail, k - 1)
    }
  }
}
