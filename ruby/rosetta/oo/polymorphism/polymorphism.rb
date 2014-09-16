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

# Note: this is for the exercise - in the wild I would be more included to reverse the interitance or (better) have a circle have a point.
class Circle < Point
  attr_reader :r
  attr_writer :r

  def self.newCopy(original)
      Circle.new(original.x, original.y, original.r)
  end

  def initialize(x, y, r)
    super(x, y)
    @r = r
  end

  def print
    puts("Circle")
  end
end
