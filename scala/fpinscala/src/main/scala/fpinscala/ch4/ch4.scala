package fpinscala

package object ch4 {
//  def map2[A,B,C](a: Option[A], b: Option[B])(f: (A, B) => C): Option[C] = a.flatMap(v1 => b.map(v2 => f(v1, v2)))
  def map2[A,B,C](a: Option[A], b: Option[B])(f: (A, B) => C): Option[C] = for {
    v1 <- a
    v2 <- b
  } yield f(v1, v2)

  def sequence[A](a: List[Option[A]]): Option[List[A]] = {
    def go[A](acc: List[A], options: List[Option[A]]): Option[List[A]] = options match {
      case Nil => Some(acc.reverse)
      case None :: _ => None
      case Some(o) :: os => go(o :: acc, os)
    }
    go(Nil, a)
  }

  def traverse[A, B](a: List[A])(f: A => Option[B]): Option[List[B]] =
    a.foldRight[Option[List[B]]](Some(Nil))((next, acc) => map2(f(next), acc)(_ :: _))
}
