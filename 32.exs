defmodule Init do
  @moduledoc """
    We shall say that an n-digit number is pandigital if it makes use of all the
    digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
    through 5 pandigital.

    The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
    multiplicand, multiplier, and product is 1 through 9 pandigital.

    Find the sum of all products whose multiplicand/multiplier/product identity
    can be written as a 1 through 9 pandigital.

    HINT: Some products can be obtained in more than one way so be sure to only
    include it once in your sum.
  """

  def chunk(list, {a, b}) do
    [
      Enum.slice(list, 0, a),
      Enum.slice(list, a, b),
      Enum.slice(list, a + b, 9)
    ]
  end

  def chunks do
    for a <- 1..7,
      b <- 1..7,
      c <- 1..7,
      a + b + c == 9,
      c >= a,
      c >= b,
      do: {a, b}
  end

  def special(list, chunks) do
    (for c <- chunks, do: Init.chunk(list, c))
    |> Enum.map(fn(chunks) -> Enum.map(chunks, fn(n) -> Init.list_to_integer(n) end) end)
    |> Enum.filter(fn([a, b, c]) -> a * b == c end)
  end

  def init do
    chunks = Init.chunks
    1..9
    |> permutations
    |> Task.async_stream(Init, :special, [chunks])
    |> Stream.filter(&(&1 != {:ok, []}))
    |> Stream.map(fn({:ok, lists}) -> lists end)
    |> Enum.to_list
    |> List.flatten
    # |> Enum.map(&Enum.to_list(&1))
  end

  def permutations([]) do [[]] end
  def permutations(list) do
    for h <- list, t <- permutations(Enum.to_list(list) -- [h]), do: [h | t]
  end

  def list_to_integer(list) do
    list
    |> Stream.map(fn(n) -> Integer.to_string(n) end)
    |> Enum.join
    |> String.to_integer
  end
end
