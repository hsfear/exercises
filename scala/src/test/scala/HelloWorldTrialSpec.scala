/**
 * Created by IntelliJ IDEA.
 * User: Howard
 * Date: 12/25/11
 * Time: 2:45 PM
 * To change this template use File | Settings | File Templates.
 */

import org.specs2._

class HelloWorldTrialSpec extends Specification { def is =

  "This is a specification to check the 'Hello world' string"                 ^
    p^
    "The 'Hello world' string should"                                           ^
    "contain 11 characters"                                                   ! e1^
    "start with 'Hello'"                                                      ! e2^
    "end with 'world'"                                                        ! e3^
    end

  def e1 = new HelloWorld(Array("Hello", "world")).toString must have size(11)
  def e2 = new HelloWorld(Array("Hello", "world")).toString must startWith("Hello")
  def e3 = new HelloWorld(Array("Hello", "world")).toString must endWith("world")
}
