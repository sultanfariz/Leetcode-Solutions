defmodule Solution do
  @spec min_partitions(n :: String.t) :: integer
  def min_partitions(n) do
    str = String.graphemes(n)
    Enum.reduce(str, 0, fn(x, acc) -> 
      v = String.to_integer(x)
      if v > acc do
        v
      else
        acc
      end
    end)
  end
end
