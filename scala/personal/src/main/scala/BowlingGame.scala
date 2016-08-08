
/**
 * Created by IntelliJ IDEA.
 * User: howardfear
 * Date: 2/15/12
 * Time: 9:55 AM
 */

class BowlingGame {

  var score = 0
  
  var frames = List(List[Int]())
  def frame = frames.length
  
  def thisFrame = frames(0)
  def lastFrame = frames(1)
  def previousFrame = frames(2)

  def roll(count: Int): BowlingGame = {
    frames = (count :: frames(0)) :: frames.tail

    scorePendingFrames()
    if (frameOver()) {
      scoreThisFrame()
      if (!gameOver)
        frames = List[Int]() :: frames
    }
    this
  }

  def scorePendingFrames() {
    if (on2Strikes)
      score += 20 + count
    else if (onStrike || onSpare)
      score += 10 + count
  }

  def scoreThisFrame() {
    if (frameOver()) {
      // Pend scoring for strikes and spares
      if (frame == 10 || (!strike(thisFrame) && !spare(thisFrame)))
        score += count(thisFrame)
    }
  }

  def count(frame:List[Int]):Int = frame.sum
  def count:Int = count(thisFrame)
  def rolls(frame:List[Int]):Int = frame.length
  def rolls:Int = rolls(thisFrame)
  def frameOver() = {
    if (frame == 10)
      rolls == 3 || (rolls == 2 && count < 10)
    else
      rolls == 2 || count == 10
  }

  def strike(frame:List[Int]):Boolean = count(frame) == 10 && rolls(frame) == 1
  def spare(frame:List[Int]):Boolean = count(frame) == 10 && rolls(frame) == 2

  def onSpare = frame > 1 && spare(lastFrame) && rolls == 1
  def onStrike = frame > 1 && strike(lastFrame) && rolls == 2
  def on2Strikes = frame > 2 && strike(lastFrame) && strike(previousFrame) && rolls == 1

  def gameOver = frame == 10 && frameOver
}


