package fpinscala.ch6

case class Vending(candies: Int, coins: Int)

object Vending {
  def purchase() : State[Vending, Unit] = State[Vending, Unit](v => v match {
    case Vending(0, _) => ((), v)
    case Vending(_, _) => ((), Vending(v.candies -1 , v.coins + 1))
  })
}
