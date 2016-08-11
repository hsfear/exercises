package fpinscala

package object ch2 {
  def isSorted[A](as: Array[A], ordered: (A,A) => Boolean): Boolean = {
    def isSortedImpl(idx: Int): Boolean =
      if (idx + 1 >= as.length) true
      else if (!ordered(as(idx), as(idx + 1))) false
      else isSortedImpl(idx + 1)
    isSortedImpl(0)
  }

  def partial1[A,B,C](a: A, f: (A,B) => C): B => C = (b: B) => f(a, b)
  def curry[A,B,C](f: (A, B) => C): A => (B => C) = (a: A) => ((b:B) => f(a,b))
  def uncurry[A,B,C](f: A => B => C): (A, B) => C = (a: A, b: B) => f(a)(b)
  def compose[A,B,C](f: B => C, g: A => B): A => C = (a: A) => f(g(a))
}
