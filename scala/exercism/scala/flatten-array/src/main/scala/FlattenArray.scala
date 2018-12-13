object FlattenArray {
  def flatten(lists: List[Any]): List[Any] = lists.foldLeft(List[Any]()) { (acc, item) =>
    item match {
      case Nil|null => acc
      case list:List[Any] => acc ++ flatten(list)
      case element => acc :+ element
    }
  }
}
