IO.inspect 1..999
  |> Enum.filter(fn(n) -> Integer.mod(n, 3) == 0 or Integer.mod(n, 5) == 0 end)
  |> Enum.sum
