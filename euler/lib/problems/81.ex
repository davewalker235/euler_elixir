defmodule Euler81 do
  def init do
    data = """
      131, 673, 234, 103,  18
      201,  96, 342, 965, 150
      630, 803, 746, 422, 111
      537, 699, 497, 121, 956
      805, 732, 524,  37, 331
    """

    data
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, ",")))
    # |> Enum.map(&String.trim/1)
    # |> Enum.map(&Integer.parse/1)
    # |> Enum.map(fn({n, _}) -> n end)
  end

  def parseData(i) do
      
  end
end
