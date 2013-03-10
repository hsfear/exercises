import scala.math.abs
import org.specs2.mutable._
import org.junit.runner.RunWith
import org.specs2.runner.JUnitRunner

@RunWith(classOf[JUnitRunner])
class ProblemsTest extends Specification {
  "P1: Lists.last" should {
    "return the last element of a list" in {
      new Lists().last(List(1, 1, 2, 3, 5, 8)) must beEqualTo(8)
    }
    "throw an exception if the list is empty" in {
      new Lists().last(List()) must throwA[NoSuchElementException]
    }
    "throw an exception for a Nil list" in {
      new Lists().last(Nil) must throwA[NoSuchElementException]
    }
  }

  "P2: Lists.penultimate" should {
    "return the next to last element of a list" in {
      new Lists().penultimate(List(1, 1, 2, 3, 5, 8)) must beEqualTo(5)
    }
  }

  "P3: Lists.kth" should {
    "return the kth element of a list" in {
      new Lists().kth(List(1, 2, 3, 4, 5), 4) must beEqualTo(4)
    }
  }
}
