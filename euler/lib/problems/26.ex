defmodule Euler26 do
  import Kernel

  def init do
    2..1000
    |> Enum.map(&test/1)
    |> Enum.filter(fn({_, p, _}) -> p !== nil end)
    |> Enum.sort(fn({_, p1, _}, {_, p2, _}) -> p1 > p2 end)
    |> Enum.map(fn({n, p, _}) -> {n, p} end)
  end

  def test(d, n \\ 1, history \\ []) when d <= n do
    result = div(n, d)
    remain = rem(n, d)
    start_repeat = Enum.find_index(history, &(&1 == remain))
    if remain === 0 or n === 0 or start_repeat !== nil do
      if start_repeat !== nil, do: start_repeat = Enum.count(history) - start_repeat
      {d, start_repeat, history}
    else
      history = history ++ [remain]
      test(d, remain, history)
    end
  end
  def test(d, n, history) when d > n do
    test(d, n * 10, history)
  end
end

# When the you hit a remainder you've seen before the decimal starts cycling

# n|d
#   0125
# 8|100
#    20
#     40
#   div
#   0142857
# 7|1000000000
#   0
#   10
#    30
#     20
#      60
#       40
#        50
#         10
#
#
#       rem

#    166
# 6|1000000
#    40
#     40
