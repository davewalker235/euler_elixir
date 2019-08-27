defmodule Euler112 do

  def init() do
    # Know amounts from problem
    init(19602, 21780)
  end

  def init(bouncy, total) when bouncy/total <= 0.99 do
    [bouncy, total]
  end

  def init(bouncy, total) do
    total = total + 1
    init(bouncy + (if is_bouncy(total), do: 1, else: 0), total)
  end

  def is_bouncy(n) do
    n
    |> to_string
    |> String.graphemes
    |> Stream.map(&Integer.parse/1)
    |> Stream.map(&(elem(&1, 0)))
    |> Stream.dedup
    |> Stream.transform(nil, fn(curr, prev) -> {(if is_nil(prev), do: [], else: [curr > prev]), curr} end)
    |> Stream.transform(nil, fn(curr, prev) -> {(if is_nil(prev), do: [], else: [curr !== prev]), curr} end)
    |> Enum.any?
  end

  def test do
    IO.inspect Euler112.is_bouncy(62062222469642)
    IO.inspect Euler112.is_bouncy(1234)
    IO.inspect Euler112.is_bouncy(43210)
  end
end
