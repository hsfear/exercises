class WordIndex

  def initialize()
    @index = { }
  end

  def add_to_index(item, string)
    string.split(/[^\w'-]+/).each { |word| @index[word.downcase] = item }
  end

  def lookup(word)
    @index[word.downcase]
  end
end
