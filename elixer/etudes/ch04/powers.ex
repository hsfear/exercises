defmodule Powers do
  import Kernel, except: [raise: 2]

  def raise(x, n) when n < 0, do: 1 / raise(x, abs(n))
  def raise(_x, n) when n == 0, do: 1
  def raise(x, n), do: x * raise(x, n - 1)
end
