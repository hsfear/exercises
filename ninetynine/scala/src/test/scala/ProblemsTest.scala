import scala.math.abs
import org.specs2.mutable._
import org.junit.runner.RunWith
import org.specs2.runner.JUnitRunner
import Lists._

@RunWith(classOf[JUnitRunner])
class ProblemsTest extends Specification {
  "P1: Lists.last" should {
    "return the last element of a list" in {
      last(List(1, 1, 2, 3, 5, 8)) must beEqualTo(8)
    }
    "throw an exception if the list is empty" in {
      last(List()) must throwA[NoSuchElementException]
    }
    "throw an exception for a Nil list" in {
      last(Nil) must throwA[NoSuchElementException]
    }
  }

  "P2: penultimate" should {
    "return the next to last element of a list" in {
      penultimate(List(1, 1, 2, 3, 5, 8)) must beEqualTo(5)
    }
  }

  "P3: kth" should {
    "return the kth element of a list" in {
      kth(List(1, 2, 3, 4, 5), 4) must beEqualTo(4)
    }
  }

  "P4: length" should {
    "return the length of a list" in {
      Lists.length(List(1, 2, 3, 4)) must beEqualTo(4)
    }
  }
}
