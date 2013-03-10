import scala.math.abs

class Lists { }

object Lists {
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

  def kth(list: List[Int], k: Int): Int =
    k match {
      case 1 => list.head
      case n if n > 1 => kth(list.tail, k - 1)
      case _ => throw new IllegalArgumentException()
    }

  def length(list: List[Int]): Int = list.foldLeft(0)((length, _) => length + 1)
}
