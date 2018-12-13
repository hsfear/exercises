import scala.collection.immutable.TreeMap

class School {
  type DB = Map[Int, Seq[String]]

  private var roster: collection.mutable.Map[Int, Seq[String]] = collection.mutable.Map()

  def add(name: String, g: Int): Unit = {
    roster += (g -> (grade(g) :+ name))
  }

  def db: DB = roster.toMap

  def grade(g: Int): Seq[String] = roster.getOrElse(g, Seq())

  def sorted: DB = TreeMap(roster.mapValues(_.sorted).toArray:_*)
}
