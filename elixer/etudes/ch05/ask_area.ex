defmodule AskArea do
  def area() do
    ans = IO.gets("R)ectangle, T)riangle, or E)llipse: ")
    shape = char_to_shape(String.upcase(String.first(ans)))
    {a, b} = get_dimensions(shape)
    cond do
      a < 0 or b < 0 -> IO.puts("Both numbers must be greater than or equal to zero.")
      shape == :unknown -> IO.puts("Unknown shape #{ans}")
      true -> Geom.area(shape, a, b)
    end
  end

  defp char_to_shape(char) when char == "R", do: :rectangle
  defp char_to_shape(char) when char == "T", do: :triangle
  defp char_to_shape(char) when char == "E", do: :ellipse
  defp char_to_shape(_char), do: :unknown

  defp get_number(prompt) do
    ans = IO.gets("Enter #{prompt} > ")
    String.to_integer(String.strip(ans))
  end
  defp get_dimensions(prompt1, prompt2), do: { get_number(prompt1), get_number(prompt2) }
  defp get_dimensions(shape) when shape == :rectangle, do: get_dimensions("width", "height")
  defp get_dimensions(shape) when shape == :triangle, do: get_dimensions("base", "height")
  defp get_dimensions(shape) when shape == :ellipse, do: get_dimensions("major radius", "minor radius")
  defp get_dimensions(shape) when shape == :unknown, do: { 0, 0 }


end
