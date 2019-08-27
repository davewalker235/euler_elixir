# defmodule Prime do
#   def is_prime(n) do
#     2..x
#     |> Stream.filter(fn(a) -> rem(x, a) == 0 end)
#     |> length() == 1
#   end
#
#   def prime(n) do
#     Stream.interval(1)
#     |> Stream.drop(2)
#     |> Stream.filter(&is_prime/1)
#     |> Enum.take(n)
#   end
# end

defmodule Prime do
  def init(n) do
    1..n
    |> permutations
    |> Stream.filter(&(Integer.mod(Enum.fetch!(&1, -1), 2) != 0))
    |> Stream.map(&Prime.list_to_integer(&1))
    |> Stream.filter(&Prime.prime?(&1))
    |> Enum.to_list
    |> Enum.max
    # |> Enum.filter(&(Integer.mod(&1, 3) != 0))

    # 2143..987654321
    # |> Stream.filter(fn(n) -> Integer.mod(n, 2) !== 0 and Integer.digits(n) == Enum.uniq(Integer.digits(n)) end)
    # |> Enum.to_list
    # |> Enum.count
  end

  def list_to_integer(list) do
    list
    |> Stream.map(fn(n) -> Integer.to_string(n) end)
    |> Enum.join
    |> String.to_integer
  end

  def list_to_string()

  def permutations([]) do [[]] end
  def permutations(list) do
    for h <- list, t <- permutations(Enum.to_list(list) -- [h]), do: [h | t]
  end

  def prime?(n) do
    case n do
      _ when n < 4 -> true
      _ ->
        2..Kernel.trunc(:math.sqrt(n))
        |> Stream.map(fn(x) -> Integer.mod(n, x) == 0 end)
        |> Enum.any?
        |> Kernel.not
    end
  end
end
