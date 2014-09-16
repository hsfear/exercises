class Point
  attr_reader :x, :y
  attr_writer :x, :y

  def initialize(*args)
    if (args.length == 1)
      @x = args[0].x
      @y = args[0].y
    else
      @x = args[0]
      @y = args[1]
    end   
  end

  def print
    puts("Point")
  end
end

# Note: this is for the exercise - in the wild I would be more included to reverse the interitance or (better) have a circle have a point.
class Circle < Point
  attr_reader :r
  attr_writer :r

  def initialize(*args)
    case args.length
      when 1
        super(args[0].x, args[0].y)
        @r = args[0].r
      when 2
        super(args[0].x, args[0].y)
        @r = args[1]
      else
        super(args[0], args[1])
        @r = args[2]
    end   
  end

  def print
    puts("Circle")
  end
end
