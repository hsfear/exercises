package fpinscala.ch6

import org.scalatest.{FunSpec, Matchers}

class StateSpec extends FunSpec with Matchers {
  describe("unit") {
    it("creates a state class") {
      val state = State[Int, String](i => (i.toString, i + 1))
      val (v, next) = state.run(1)
      assert(v == "1")
      assert(state.run(next)._1 == "2")
    }
  }

  describe("stack") {
    it("can push and pop values") {
      val a = State.init[State.Stack[Int]].
        flatMap(_ => State.push(1)).
        flatMap(t => State.push(t * 2)).
        flatMap(_ => State.pop()).
        flatMap(o => State.push(o * 5))
      val (v, s) = a.run(List())
      assert(a.run(List())._2 == List(10, 1))

      val b = for {
        _ <- State.init[State.Stack[Int]]
        t <- State.push(10)
        _ <- State.push(t * 20)
        o <- State.pop()
        _ <- State.push(o * 5)
      } yield ()
      assert(b.run(List())._2 == List(1000, 10))
    }
  }
}
