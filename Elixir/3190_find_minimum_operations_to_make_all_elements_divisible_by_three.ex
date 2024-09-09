defmodule Solution do
  @spec minimum_operations(nums :: [integer]) :: integer
  def minimum_operations([]), do: 0
  def minimum_operations([h | t]) when rem(h, 3) == 0, do: minimum_operations(t)
  def minimum_operations([h | t]), do: 1 + minimum_operations(t)
end
