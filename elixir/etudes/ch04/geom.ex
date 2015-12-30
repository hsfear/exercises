defmodule Geom do
  def area(shape, a, b) when a >= 0 and b >= 0 do
    case shape do
      :rectangle -> a * b
      :triangle -> (a * b) / 2.0
      :ellipse -> :math.pi() * a * b
    end
  end
  def area(_, _, _) do
    0
  end
end
