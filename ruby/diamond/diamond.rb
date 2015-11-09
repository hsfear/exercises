class Diamond

  def initialize(letter)
    center = letter.upcase.ord - 'A'.ord
    size = 2 * center + 1
    last = size - 1

    @lines = Array.new(size) do | y |
      offset = y <= center ? y : last - y
      Array.new(size) do | x |
        (x == center - offset) || (x == center + offset) ?  ('A'.ord + offset).chr : ' '
      end
    end
  end

  attr_reader :lines
end
