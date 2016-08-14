package fpinscala.ch6

case class State[S,+A](run: S => (A,S)) {
  import State._
  def flatMap[B](f: A => State[S, B]): State[S, B] = State(s => {
    val (a, s1) = run(s)
    f(a).run(s1)
  })

  def map[B](f: A => B): State[S, B] = this.flatMap(a => unit(f(a)))

  def map2[B,C](rb: State[S, B])(f: (A, B) => C): State[S, C] =
    this.flatMap(a => rb.map(b => f(a, b)))
}

object State {
  def unit[S,A](a: A): State[S,A] = State(s => (a, s))
  def init[S]: State[S, S] = State(s => (s, s))
  def get[S]: State[S, S] = State(s => (s, s))
  def set[S](s: S): State[S, Unit] = State(_ => ((), s))

  type Stack[A] = List[A]
  def push[A](a: A) = State[Stack[A], A](s => (a, a :: s))
  def pop[A]() = State[Stack[A], A](s => (s.head, s.tail))
}
