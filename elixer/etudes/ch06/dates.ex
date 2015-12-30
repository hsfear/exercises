defmodule Dates do
  def date_parts(string), do: Enum.map(String.split(string, "-"), &String.to_integer/1)

  def julian(string) do
    [year, mo, day] = date_parts(string)
    count_days(mo, day, days_in_month(year))
  end

  defp count_days(1, day, _), do: day
  defp count_days(mo, day, [head|tail]), do: head + count_days(mo - 1, day, tail)

  defp is_leap_year(year), do: (rem(year, 4) == 0 and rem(year, 100) != 0) or (rem(year, 400) == 0)

  defp days_in_month(year) do
    if is_leap_year(year), do: [31,29,31,30,31,30,31,31,30,31,30,31], else: [31,28,31,30,31,30,31,31,30,31,30,31]
  end
end
