import org.scalatest.FlatSpec
import org.scalatest.matchers.ShouldMatchers

/**
 * Created by IntelliJ IDEA.
 * User: howardfear
 * Date: 2/15/12
 * Time: 8:38 AM
 */

class BowlingSuite extends FlatSpec with ShouldMatchers {

  "A new game" should "have a score of zero" in {
    new BowlingGame().score should equal(0)
  }

  it should "be in the first frame" in  {
    new BowlingGame().frame should equal(1)
  }

  "After the first frame, it" should "have a score equal to the sum of the two balls" in {
    new BowlingGame().roll(3).roll(2).score should equal(5)
  }

  it should "be in the second frame" in  {
    new BowlingGame().roll(3).roll(2).frame should equal(2)
  }

  "After the second frame it" should "have a score equal to the sum of the frames balls" in {
    new BowlingGame().roll(3).roll(2).roll(8).roll(1).score should equal(14)
  }

  it should "be in the third frame" in  {
    new BowlingGame().roll(3).roll(2).roll(8).roll(1).frame should equal(3)
  }

  "After a spare, it" should "count the ball after the spare twice" in {
    new BowlingGame().roll(3).roll(7).roll(8).roll(0).score should equal(26)
  }

  "After a strike, it" should "count each ball in the next frame twice" in {
    new BowlingGame().roll(10).roll(3).roll(6).score should equal(28)
  }

  "After two strikes, it" should "count the next ball three times" in {
    new BowlingGame().roll(10).roll(10).roll(3).roll(0).score should equal(39)
  }

  "After a strike in the 10th frame, it" should "count the next two balls" in {
    new BowlingGame().
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(10).
      roll(3).roll(6).score should equal(100)
  }

  "After a strike in the 9th and 10th frame, it" should "count the next ball twice" in {
    new BowlingGame().roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(10).
      roll(10).
      roll(3).roll(6).score should equal(114)
  }

  "After a striking out the 10th frame, it" should "count the last three strikes as 30" in {
    new BowlingGame().roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(10).
      roll(10).
      roll(10).score should equal(111)
  }

  "After a striking out the 9th and 10th frames, it" should "count the last four strikes as 60" in {
    new BowlingGame().roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(10).
      roll(10).
      roll(10).
      roll(10).score should equal(132)
  }

  "After a striking out the 8th, 9th and 10th frames, it" should "count the last five strikes as 90" in {
    new BowlingGame().roll(9).roll(0).
                      roll(9).roll(0).
                      roll(9).roll(0).
                      roll(9).roll(0).
                      roll(9).roll(0).
                      roll(9).roll(0).
                      roll(9).roll(0).
                      roll(10).
                      roll(10).
                      roll(10).
                      roll(10).
                      roll(10).score should equal(153)
  }

  "After a two strikes in the 10th frame, it" should "count the last three balls" in {
    new BowlingGame().roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(9).roll(0).
      roll(10).
      roll(10).
      roll(9).score should equal(110)
  }
}