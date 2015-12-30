defmodule Dates do
  def date_parts(string), do: Enum.map(String.split(string, "-"), &String.to_integer/1)
end
