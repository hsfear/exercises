package fpinscala.ch3

sealed trait Tree[+A]
case class Leaf[A](value: A) extends Tree[A]
case class Branch[A](left: Tree[A], right: Tree[A]) extends Tree[A]

object Tree {
  def size[A](tree: Tree[A]): Int = fold(tree)((_) => 1)((l, r) => 1 + l + r)

  def depth[A](tree: Tree[A]): Int = fold(tree)((_) => 1)((l, r) => 1 + (l max r))

  def fold[A,B](tree: Tree[A])(leaf: A => B)(branch: (B,B) => B): B =  tree match {
    case Leaf(value) => leaf(value)
    case Branch(left, right) => branch(fold(left)(leaf)(branch), fold(right)(leaf)(branch))
  }
}
