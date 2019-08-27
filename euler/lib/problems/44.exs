defmodule Euler44 do
  def pent(n) do
    Kernel.trunc (n * ((3 * n) - 1))/2
  end

  def stream() do
    Stream.resource(
      fn -> 1 end,
      fn(n) -> {[Pent.pent(n)], n + 1} end,
      fn(n) -> n end
    )
  end

  def rev(n) do
    Stream.resource()
  end

  def init do
    Pent.stream |> Enum.take_while(fn(n) -> n < 1000 end)
  end
end


# Need to constantly subtract smaller values from current to see if the result
# is already in the list.  Store those that match with a counter, once the
# counter hits two you've found your match

# p = n(3n−1)/2
# 2p = 3n^2 - n
