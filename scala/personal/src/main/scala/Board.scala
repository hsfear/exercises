
/**
 * Created by IntelliJ IDEA.
 * User: Howard
 * Date: 12/25/11
 * Time: 2:57 PM
 * To change this template use File | Settings | File Templates.
 */
import scala.math.abs

class Board(width:Int, height:Int, val liveCells:List[(Int, Int)]) {
  def this() = this(3, 3, List.empty)
  def this(liveCells:List[(Int, Int)]) = this(3, 3, liveCells)

  def spawn():Board = {
    val survivors = for {
      i <- 0 until width
      j <- 0 until height
      if shouldLive((i,j))
    } yield(i, j)
    new Board(width, height, survivors.toList)
  }
  
  def shouldLive(cell: (Int, Int)):Boolean = {
    if (liveCells.contains(cell)) shouldSurvive(cell) else shouldRevive(cell)    
  }
  def shouldSurvive(cell:(Int, Int)):Boolean = (2 to 3).contains(neighborsOf(cell))
  def shouldRevive(cell:(Int, Int)):Boolean = neighborsOf(cell) == 3
  def neighborsOf(cell:(Int, Int)):Int = liveCells.count { c => areNeighbors(cell, c) }
  def areNeighbors(first:(Int, Int), second:(Int, Int)):Boolean = {
    (first != second) && abs(first._1 - second._1) <= 1 && abs(first._2 - second._2) <= 1
  }
}



