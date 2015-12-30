defmodule Geom do
  def area({shape, a, b}) do
    area(shape, a, b)
  end
  defp area(:rectangle, height, width) when height >= 0 and width >= 0 do
    height * width
  end
  defp area(:triangle, base, height) when base >= 0 and height >= 0 do
    (base * height) / 2.0
  end
  defp area(:ellipse, major, minor) when major >= 0 and major >= 0 do
    :math.pi() * major * minor
  end
  defp area(_, _, _) do
    0
  end
end
