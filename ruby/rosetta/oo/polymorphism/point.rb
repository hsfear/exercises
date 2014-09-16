class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def print
    puts("Point")
  end
end
