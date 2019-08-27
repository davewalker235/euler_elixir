defmodule Euler49 do
  import Prime
  def init do
    ns = 1001..9999 |> Enum.filter(fn n -> Prime.prime?(n) end)
    ns
    |> Enum.map(fn n -> Enum.sort(Enum.filter(ns, fn x -> Euler49.sort_int(x) == Euler49.sort_int(n) end)) end)
    |> Enum.filter(fn l -> l != [] end)
    |> Enum.uniq
    |> Enum.filter(fn l -> Enum.count(l) > 2 end)
    # |> Enum.take(100)
    # |> Enum.map(&Euler49.diff/1)
  end

  def sort_int(n) do
    n |> Integer.to_charlist |> Enum.sort
  end

  def diff([]) do [] end
  def diff([_]) do [] end
  def diff([a, b]) do [b - a] end
  def diff([a, b | tail]) do [b - a] ++ diff([b] ++ tail) end
end
