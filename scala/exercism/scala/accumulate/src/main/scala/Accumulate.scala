class Accumulate {
  def accumulate[A, B](f: (A) => B, list : List[A]): List[B] = for (i <- list) yield f(i)
}
