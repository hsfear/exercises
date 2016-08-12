package fpinscala

package object ch3 {
  def hasSubsequence[A](sup: List[A], sub: List[A]): Boolean = {
    def startsWith(s: List[A], prefix: List[A]): Boolean = (s, prefix) match {
      case (_, Nil) => true
      case (Nil, _) => false
      case (h1::_, h2::_) if h1 != h2 => false
      case (_::t1, _::t2) => startsWith(t1, t2)
    }
    (sup, sub) match {
      case (_, Nil) => true
      case (Nil, _) => false
      case (_::tail, _) => if (startsWith(sup, sub)) true else hasSubsequence(tail, sub)
    }

  }
}
