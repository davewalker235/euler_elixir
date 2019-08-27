defmodule Euler3 do
  import Prime

  def init() do
    max = Kernel.trunc :math.sqrt(600851475143)
    max..2
    |> Stream.filter(fn n -> Prime.prime?(n) and Integer.mod(600851475143, n) == 0 end)
    |> Enum.take(1)

  end
end
