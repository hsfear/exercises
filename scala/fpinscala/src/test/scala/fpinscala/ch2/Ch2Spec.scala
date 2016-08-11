package fpinscala.ch2

import org.scalatest.{FunSpec, Matchers}

class Ch2Spec extends FunSpec with Matchers {
  describe("isSorted") {
    it("returns true for an empty array") {
      assert(isSorted[String](Array(), _ < _))
    }
    it("returns true for a single item array") {
      assert(isSorted[Int](Array(1), _ < _))
    }
    it("returns true if the array is sorted according to the operator") {
      assert(isSorted[Int](Array(1,2,3), _ < _))
    }
    it("returns false if the array is not sorted according to the operator") {
      assert(!isSorted[Int](Array(1,3,2), _ < _))
    }
  }
}
