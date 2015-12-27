defmodule Geom do
    def area(:rectangle, height, width) do
        height * width
    end
    def area(:triangle, base, height) do
        (base * height) / 2.0
    end
    def area(:ellipse, major, minor) do
        :math.pi() * major * minor
    end
end
