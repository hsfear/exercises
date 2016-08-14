package fpinscala

package object ch6 {
//  type Rand[+A] = RNG => (A, RNG)
//
//  trait RNG {
//    def nextInt: (Int, RNG)
//  }
//  case class SimpleRNG(seed: Long) extends RNG {
//    def nextInt: (Int, RNG) = {
//      println("here")
//      val newSeed = (seed * 0x5DEECE66DL + 0xBL) & 0xFFFFFFFFFFFFL
//      val nextRNG = SimpleRNG(newSeed)
//      val n = (newSeed >>> 16).toInt
//      (n, nextRNG)
//    }
//  }
//
//  val int: Rand[Int] = _.nextInt
//  def unit[A](a: A): Rand[A] = rng => (a, rng)
//  def map[A,B](s: Rand[A])(f: A => B): Rand[B] = rng => {
//    val (a, rng2) = s(rng)
//    (f(a), rng2)
//  }
//  def nonNegativeEven: Rand[Int] = map(nonNegativeInt)(i => i - i % 2)
//
//  var nonNegativeInt: Rand[Int] = { rng =>
//    val (i, nextrng) = rng.nextInt
//    if (i >= 0) (i, nextrng) else nonNegativeInt(nextrng)
//  }
//
//  def map2[A,B,C](ra: Rand[A], rb: Rand[B])(f: (A, B) => C): Rand[C] = rng => {
//    val (a, rng2) = ra(rng)
//    val (b, rng3) = rb(rng2)
//    (f(a, b), rng3)
//  }
//
//  def flatMap[A,B](f: Rand[A])(g: A => Rand[B]): Rand[B] = rng => {
//    val (a, rng2) = f(rng)
//    g(a)(rng2)
//  }
//
//  def nonNegativeLessThan(n: Int): Rand[Int] = flatMap(nonNegativeInt) { i =>
//    val mod = i % n
//    if (i + (n - 1) - mod >= 0) unit(mod) else nonNegativeLessThan(n)
//  }
//
//  def altMap[A,B](s: Rand[A])(f: A => B): Rand[B] = flatMap(s)(a => unit(f(a)))
//
//  def altMap2[A,B,C](ra: Rand[A], rb: Rand[B])(f: (A, B) => C): Rand[C] =
//    flatMap(ra) { a => map(rb)(b => f(a, b)) }
}
