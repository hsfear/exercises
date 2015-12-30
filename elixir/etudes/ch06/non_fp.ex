defmodule NonFP do
  def generate_pockets([],_), do: []
  def generate_pockets([?F|tail], prob), do: [[0] | generate_pockets(tail, prob)];
  def generate_pockets([?T|tail], prob) do
    :random.seed(:erlang.now())
    [generate_tooth(prob) | generate_pockets(tail, prob)]
  end

  defp generate_tooth(prob) do
    base_depth = if :random.uniform() < prob, do: 2, else: 3
    generate_tooth(base_depth, 6)
  end

  defp generate_tooth(_, 0), do: []
  defp generate_tooth(base, count) do
    offset = :random.uniform(3) - 2
    [base + offset | generate_tooth(base, count - 1)]
  end
end
