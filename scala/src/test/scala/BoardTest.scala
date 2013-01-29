
/**
 * Created by IntelliJ IDEA.
 * User: Howard
 * Date: 12/25/11
 * Time: 2:57 PM
 * To change this template use File | Settings | File Templates.
 */
import scala.math.abs
import org.specs2.mutable._

class BoardTest extends Specification {
  "The board" should {
    "be empty when created empty" in {
      new Board(List.empty).liveCells must beEmpty
    }

    "have the cells it was created with" in {
      new Board(List((1,1), (2,2))).liveCells must havePairs ((1,1), (2,2))
    }

    "spawn an empty board if empty" in {
      next_generation_for(List.empty) must beEmpty
    }

    "kill a lonely cell" in {
      next_generation_for(List((1,1))) must beEmpty
    }

    "keep a cell with two neighbors" in {
      next_generation_for(List((1,1), (2,0), (2, 2))) must havePair (1,1)
    }

    "keep a cell with three neighbors" in {
      next_generation_for(List((1,0), (1,1), (2,0), (2, 2))) must havePair (1,1)
    }

    "revive a cell with three neighbors" in {
      next_generation_for(List((1,0), (2,0), (2, 2))) must havePair (1,1)
    }

    "should handle the star pattern" in {
      next_generation_for(List((0,0), (2,0), (1,1), (0,2), (2, 2))) must_== List((0,1), (1,0), (1,2), (2,1))
    }
  }

  "The neighbor count" should {
    "be zero for a lonely cell" in {
      val board = new Board(List((1,1)))
      board.neighborsOf((1,1)) must_== 0
    }
    "include left and right neighbors" in {
      val board = new Board(List((0,1), (1,1), (2,1)))
      board.neighborsOf((1,1)) must_== 2
    }
    "include top and bottom neighbors" in {
      val board = new Board(List((1,0), (1,1), (1,2)))
      board.neighborsOf((1,1)) must_== 2
    }
    "include diagonal neighbors" in {
      val board = new Board(List((0,0), (0,2), (1,1), (2,0), (2,2)))
      board.neighborsOf((1,1)) must_== 4
    }
  }

  def next_generation_for(cells:List[(Int, Int)]):List[(Int, Int)] = {
    new Board(cells).spawn().liveCells
  }
}

import org.specs2.mutable._

