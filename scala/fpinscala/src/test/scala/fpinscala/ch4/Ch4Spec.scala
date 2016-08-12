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

  describe("sequence") {
    it("converts a list of options to an option of a list") {
      assert(sequence(List(Some(1), Some(2))) == Some(List(1,2)))
    }
    it("returns None if any members of the list are None") {
      assert(sequence(List(Some(1), None, Some(2))) == None)
    }
  }

  describe("traverse") {
    it("converts a list of values and a function that maps a value to an option to an option of a list") {
      assert(traverse(List(1, 2))(Some(_)) == Some(List(1,2)))
    }
    it("returns None if the function returns None for any of the values") {
      def testf(i: Int): Option[Int] = if (i != 2) Some(i) else None
      assert(traverse(List(1, 2, 3))(testf) == None)
    }
  }
}
