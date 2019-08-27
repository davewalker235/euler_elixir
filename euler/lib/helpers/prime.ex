defmodule Prime do
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

  def stream do
    Stream.unfold( [], fn primes ->
      next = next_prime(primes)
      { next, [next | primes] }
    end )
  end

  defp next_prime([]), do: 2
  defp next_prime(primes) when is_list primes do
    primes |> next_primes(1) |> List.first
  end
  defp next_primes(primes, quantity) when is_list primes and is_integer quantity do
    from = List.first(primes) + 1
    integers(from)
      |> Stream.drop_while(fn number ->
           Enum.any?(primes, fn prime ->
             rem(number, prime) == 0
           end )
         end )
      |> Enum.take(quantity)
  end

  defp integers(n) when is_integer(n) do
    Stream.iterate(n, &(&1+1))
  end
end
