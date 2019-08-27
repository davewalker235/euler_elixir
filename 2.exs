fibs = Stream.unfold({1, 1}, fn {a, b} ->
  {a, {b, a + b}}
end)

fibs
|> Enum.take_while(fn(a) -> a < 4000000 end)
|> Stream.filter(fn(a) -> Integer.mod(a, 2) == 0 end)
|> Enum.sum
|> IO.inspect
