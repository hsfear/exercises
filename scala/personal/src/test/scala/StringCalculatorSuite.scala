import org.scalatest.FunSuite

/**
 * Created by IntelliJ IDEA.
 * User: howardfear
 * Date: 2/14/12
 * Time: 9:57 AM
 * To change this template use File | Settings | File Templates.
 */

class StringCalculatorSuite extends FunSuite {
  def add(numbers: String): Int = {
    numbers match {
      case "" => 0
      case _ => numbers.split("[,\\n]").map(_.toInt).foldLeft(0)((b,a) => b+a)
    }
  }

  test("Adding the empty string returns 0") {
    assert(add("") == 0)
  }

  test("Adding a single number returns that number") {
    assert(add("1") == 1)
  }

  test("Adding multiple numbers returns the sum") {
    assert(add("1,2,3") == 6)
  }

  test("Numbers can be separated by newlines") {
    assert(add("1\n2\n3") == 6)
  }
}