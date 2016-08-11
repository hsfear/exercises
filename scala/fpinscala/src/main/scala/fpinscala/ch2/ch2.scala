package fpinscala

package object ch2 {
  def isSorted[A](as: Array[A], ordered: (A,A) => Boolean): Boolean = {
    def isSortedImpl(idx: Int): Boolean =
      if (idx + 1 >= as.length) true
      else if (!ordered(as(idx), as(idx + 1))) false
      else isSortedImpl(idx + 1)
    isSortedImpl(0)
  }
}
