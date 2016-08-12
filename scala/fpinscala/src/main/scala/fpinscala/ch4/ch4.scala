package fpinscala

package object ch4 {
//  def map2[A,B,C](a: Option[A], b: Option[B])(f: (A, B) => C): Option[C] = a.flatMap(v1 => b.map(v2 => f(v1, v2)))
  def map2[A,B,C](a: Option[A], b: Option[B])(f: (A, B) => C): Option[C] = (a, b) match {
    case (Some(v1), Some(v2)) => Some(f(v1, v2))
    case (_, _) => None
  }
}
