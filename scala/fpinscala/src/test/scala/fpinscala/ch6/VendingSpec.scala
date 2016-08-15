package fpinscala.ch6

import org.scalatest.{FunSpec, Matchers}

class VendingSpec extends FunSpec with Matchers {
  describe("purchase") {
    it("increments the number of coins and decrements the number of candies") {
      val result = Vending.purchase().run(Vending(5, 10))
      assert(result._2.candies == 4)
      assert(result._2.coins == 11)
    }
    it("does nothing when there are no candies left") {
      val result = Vending.purchase().run(Vending(0, 10))
      assert(result._2.candies == 0)
      assert(result._2.coins == 10)
    }
  }

  describe("fold") {
    it("applies flatmap recursively") {
      val inputs = 1 to 5
      val output = inputs.tail.foldLeft[State[Vending, Unit]](Vending.purchase()) { (acc, next) =>
        acc.flatMap(_ => Vending.purchase())
      }
      val result = output.run(Vending(5,10))
      assert(result._2.candies == 0)
      assert(result._2.coins == 15)
    }
  }
}
