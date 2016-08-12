package fpinscala.ch3

import org.scalatest.{FunSpec, Matchers}

class Ch3Spec extends FunSpec with Matchers {
  describe("hasSubsequence") {
    it("returns true if the sequence contains the subsequence") {
      assert(hasSubsequence(List(1,2,3,4), List(2,3)))
    }
    it("returns false if the sequence does not contain the subsequence") {
      assert(!hasSubsequence(List(1,2,3,4), List(2,4)))
    }
    it("returns false if the sequence is empty but the subsequence is not") {
      assert(!hasSubsequence(Nil, List(2,3)))
    }
    it("returns true if the subsequence is empty") {
      assert(hasSubsequence(List(1,2,3,4), Nil))
    }
  }
}
