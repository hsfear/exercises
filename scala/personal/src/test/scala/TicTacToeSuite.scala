import org.scalatest.FunSuite

/**
 * Created by IntelliJ IDEA.
 * User: howardfear
 * Date: 2/10/12
 * Time: 11:04 AM
 * To change this template use File | Settings | File Templates.
 */


class TicTacToeSuite extends FunSuite {
  test("New game is not done") {
    assert(!new TicTacToe().isDone)
  }

  test("Drawn game is done") {
    assert(new TicTacToe("xoxooxxxo").isDone)
  }

  test("A board with moves remaining is not drawn") {
    assert(!new TicTacToe(" oxooxxxo").isDone)
    assert(!new TicTacToe("xoxooxxx ").isDone)
    assert(!new TicTacToe("         ").isDone)
  }

  test("a board with a winning position has a winner") {
    assert(new TicTacToe("xxx      ").hasWinner)
    assert(new TicTacToe("   xxx   ").hasWinner)
    assert(new TicTacToe("      xxx").hasWinner)
    assert(new TicTacToe("   ooo   ").hasWinner)
    assert(new TicTacToe("x  x  x  ").hasWinner)
    assert(new TicTacToe(" x  x  x ").hasWinner)
    assert(new TicTacToe("  x  x  x").hasWinner)
    assert(new TicTacToe("x   x   x").hasWinner)
    assert(new TicTacToe("  x x x  ").hasWinner)
  }

  test("a board without a winning position does not have a winner") {
    assert(!new TicTacToe("xox      ").hasWinner)
  }

  test("a board with a winner is done") {
    assert(new TicTacToe("xxx      ").isDone)
  }

  test("A new board with a single move produces the correct board") {
    assert(new TicTacToe().move(0).board.equals("x        "))
  }

  test("A game with a winner") {
    assert(new TicTacToe().move(0).move(3).move(1).move(4).move(2).hasWinner)
  }

  test("A game that does not yest have a winner") {
    assert(!new TicTacToe().move(0).move(3).move(1).move(4).hasWinner)
  }

  test("A cat's game") {
    val catsGame = new TicTacToe().move(4).move(0).move(8).move(2).move(1).move(7).move(6).move(3).move(5)
    assert(catsGame.isDone)
    assert(!catsGame.hasWinner)
  }
}