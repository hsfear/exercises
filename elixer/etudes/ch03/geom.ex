defmodule Geom do
    def area(:rectangle, height, width) when height >= 0 and width >= 0 do
        height * width
    end
    def area(:triangle, base, height) when base >= 0 and height >= 0 do
        (base * height) / 2.0
    end
    def area(:ellipse, major, minor) when major >= 0 and major >= 0 do
        :math.pi() * major * minor
    end
    def area(_, _, _) do
        0
    end
end
