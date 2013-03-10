import scala.math.abs

class Lists { }

object Lists {
  def last(list: List[Int]): Int =
    list match {
      case last :: Nil => last
      case Nil => throw new NoSuchElementException()
      case _ => last(list.tail)
    }

  def penultimate(list: List[Int]): Int =
    list match {
      case head :: _ :: Nil => head
      case Nil => throw new NoSuchElementException()
      case _  => penultimate(list.tail)
    }

  def kth(list: List[Int], k: Int): Int =
    k match {
      case 1 => list.head
      case n if n > 1 => kth(list.tail, k - 1)
      case _ => throw new IllegalArgumentException()
    }

  def length(list: List[Int]): Int = list.foldLeft(0)((length, _) => length + 1)

  def reverse(list: List[Int]): List[Int] =
    list.foldLeft(Nil: List[Int])((acc, head) => head :: acc)
}
