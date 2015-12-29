defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  def raise(x, n) when n < 0, do: 1 / raise(x, abs(n))
  def raise(x, n), do: raise(x, n, 1)

  defp raise(_x, n, acc) when n == 0, do: acc
  defp raise(x, n, acc), do: raise(x, n - 1, x * acc)

  def nth_root(x, n), do: nth_root(x, n, x / 2.0)
  defp nth_root(x, n, a) do
    IO.puts("Current guess is #{a}")
    f = raise(a, n) - x
    fprime = n * raise(a, n - 1)
    next =  a - f / fprime
    change = next - a

    if abs(change) < 1.0e-8 do
      next
    else
      nth_root(x, n, next)
    end
  end


end
