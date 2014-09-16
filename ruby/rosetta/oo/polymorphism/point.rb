class Point
  attr_reader :x, :y
  attr_writer :x, :y

  def self.newCopy(original)
      Point.new(original.x, original.y)
  end

  def initialize(x, y)
    @x = x
    @y = y
  end

  def print
    puts("Point")
  end
end
