defmodule Init do
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

  def prime(1) do true end
  def prime(2) do true end

  def init() do
    :math.sqrt(600851475143)
  end
end
