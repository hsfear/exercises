
/**
 * Created by IntelliJ IDEA.
 * User: howardfear
 * Date: 2/10/12
 * Time: 11:19 AM
 * To change this template use File | Settings | File Templates.
 */

class TicTacToe(val board: String) {
  def this() = this("         ")

  val winningPositions = Array((0, 1, 2), (3, 4, 5), (6, 7, 8), (0, 3, 6), (1, 4, 7), (2, 5, 8), (0, 4, 8), (2, 4, 6))

  def isDone: Boolean = hasWinner || movesRemaining == 0
  def movesRemaining: Int = board.count { _ == ' ' }
  def hasWinner: Boolean = winningPositions.exists { isWinner(_) }
  def isWinner(position: Tuple3[Int,  Int,  Int]): Boolean = {
    board(position._1) != ' ' &&
      board(position._1) == board(position._2) &&
      board(position._2) == board(position._3)
  }
  def move(position: Int): TicTacToe = {
    new TicTacToe(board.slice(0, position) + player + board.slice(position + 1, board.length()))
  }

  def player():String = {
    (movesRemaining % 2) match {
      case 0 => "o"
      case _ => "x"
    }
  }
}