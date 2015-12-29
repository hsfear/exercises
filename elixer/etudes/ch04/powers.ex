defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  def raise(x, n) when n < 0, do: 1 / raise(x, abs(n))
  def raise(x, n), do: raise(x, n, 1)

  defp raise(_x, n, acc) when n == 0, do: acc
  defp raise(x, n, acc), do: raise(x, n - 1, x * acc)
end
