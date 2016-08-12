package fpinscala

package object ch5 {
  def ones(): Stream[Int] = Stream.cons(1, ones())
  def fibs(): Stream[Int] = {
    def next(v1: Int, v2: Int): Stream[Int] = Stream.cons(v1, next(v2, v1 + v2))
    next(0, 1)
  }
  def unfold[A, S](z: S)(f: S => Option[(A, S)]): Stream[A] = f(z) match {
    case None => Stream.empty
    case Some((v, s)) => Stream.cons(v, unfold(s)(f))
  }
}
