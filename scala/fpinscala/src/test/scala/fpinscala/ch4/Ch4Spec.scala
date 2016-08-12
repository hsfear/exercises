package fpinscala.ch4

import org.scalatest.{FunSpec, Matchers}

class Ch4Spec extends FunSpec with Matchers {
  describe("map2") {
    it("maps a function across two option parameters") {
      assert(map2(Some(10), Some(20))(_ + _) == Some(30))
    }
    it("returns None of either paramter is None") {
      assert(map2(Some(10), None)(_ + _) == None)
      assert(map2[Int, Int, Int](None, Some(20))(_ + _) == None)
    }
  }
}
