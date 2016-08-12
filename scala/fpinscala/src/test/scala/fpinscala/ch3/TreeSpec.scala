package fpinscala.ch3

import org.scalatest.{FunSpec, Matchers}

class TreeSpec extends FunSpec with Matchers {
  describe("size") {
    it("returns 1 for a Leaf") {
      assert(Tree.size(Leaf(10)) == 1)
    }
    it("returns correctly for Branch") {
      assert(Tree.size(Branch(Leaf(10), Leaf(20))) == 3)
    }
  }
}
