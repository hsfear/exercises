defmodule Teeth do
  def alert(teeth), do: alert(1, teeth)
  defp alert(_, []), do: []
  defp alert(current, [head|tail]) do
    needs_attention = if needs_attention(head), do: [current], else: []
    needs_attention ++ alert(current + 1, tail)
  end

  defp needs_attention(depths), do: Stats.maximum(depths) >= 4

  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
      [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
      [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
      [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
      [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
      [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
      [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
      [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
      [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
      [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
      [3,2,3,2,3,2]]
  end
end
