package fpinscala.ch5

import org.scalatest.{FunSpec, Matchers}

class Ch5Spec extends FunSpec with Matchers {
  describe("fibs") {
    it("returns a lazy fib sequence") {
      assert(fibs.take(5).toList == List(0, 1, 1, 2, 3))
    }
  }
}
