defmodule Euler31 do
  @coins [1, 2, 5, 10] #, 20, 50, 100, 200]
  @slots 0..10 #200

  def init do
    matrix = @coins |> Enum.map(fn(c) -> {c, (@slots |> Enum.map(&(if c > &1, do: 0, else: 1)))} end)
    IO.inspect matrix
    {_, list} = matrix
    |> Enum.reduce(&Euler31.red/2)
    List.last(list)
  end

  def red({c, n}, {_, p}) do
    list1 = Enum.zip(n, p) |> Enum.map(&summer/1)
    # list2 = Enum.zip((List.duplicate(0, c) ++ list), list) |> Enum.map(&summer/1)
    # list3 = Enum.zip(list, list2) |> Enum.map(&summer/1)

    {c, list1}
  end

  def summer({a, b}) do
    a + b
  end
end

# https://www.youtube.com/watch?v=8LusJS5-AGo&list=PLrmLmBdmIlpsHaNTPP_jHHDx_os9ItYXr
#
#    1 2 3 4 5 6 7 8 9 10 11 12
# 1  1 1 1 1 1 1 1 1 1 1  1  1
# 2  1 2 2 3 3 4 4 5 5 6  6  7
# 5  1 2 2 3 4 5 6 7 8 10 11 13
# 10 1 2 2 3 4 5 6 7 8 11 13 15
