object Bob {
  def response(statement: String): String = statement.trim match {
    case string if string.isEmpty => "Fine. Be that way!"
    case string if isForceful(string) && string.endsWith("?") => "Calm down, I know what I'm doing!"
    case string if isForceful(string) => "Whoa, chill out!"
    case string if string.endsWith("?") => "Sure."
    case _ => "Whatever."
  }

  private def isForceful(string: String) = {
    string.exists(_.isLetter) && !string.exists(_.isLower)
  }
}
