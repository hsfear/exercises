/**
 * Created by IntelliJ IDEA.
 * User: Howard
 * Date: 12/23/11
 * Time: 3:38 PM
 * To change this template use File | Settings | File Templates.
 */

class HelloWorld(words:Array[String]) {
  override def toString:String = if (!words.isEmpty) words.reduceLeft[String] { (acc, n) => acc + " " + n } else ""
}

object HelloWorld extends App {
  override def main(args:Array[String]) =  println(new HelloWorld(args).toString)
}

