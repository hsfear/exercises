/**
 * Created by IntelliJ IDEA.
 * User: Howard
 * Date: 12/23/11
 * Time: 3:38 PM
 * To change this template use File | Settings | File Templates.
 */

import org.specs2.mutable._

class HelloWorldTest extends Specification {

  "The 'Hello world' string" should {
    "contain 11 characters" in {
      new HelloWorld(Array("Hello", "world")).toString must have size(11)
    }
    "start with 'Hello'" in {
      new HelloWorld(Array("Hello", "world")).toString must startWith("Hello")
    }
    "end with 'world'" in {
      new HelloWorld(Array("hello", "world")).toString must endWith("world")
    }
  }
}



import org.specs2.mutable._

