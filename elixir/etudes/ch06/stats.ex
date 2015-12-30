defmodule Stats do
  def minimum([x|[]]), do: x
  def minimum([x|tail]) do
    min = minimum(tail)
    if x > min, do: min, else: x
  end

  def maximum([x|[]]), do: x
  def maximum([x|tail]) do
    max = maximum(tail)
    if x > max, do: x, else: max
  end

  def range(a, b) when a == b, do: [a]
  def range(a, b), do: [a | range(a + 1, b)]
end
