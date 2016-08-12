package fpinscala

package object ch5 {
  def ones(): Stream[Int] = unfold(Nil)((_) => Some((1, Nil)))

  def fibs(): Stream[Int] = unfold((0, 1)){ case (v1, v2) => Some((v1, (v2, v1 + v2))) }

  def unfold[A, S](z: S)(f: S => Option[(A, S)]): Stream[A] = f(z) match {
    case None => Stream.empty
    case Some((v, s)) => Stream.cons(v, unfold(s)(f))
  }
}
