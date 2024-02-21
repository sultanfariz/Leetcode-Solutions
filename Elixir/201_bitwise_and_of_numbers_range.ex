defmodule Solution do
  import Bitwise

  @spec range_bitwise_and(left :: integer, right :: integer) :: integer
  def range_bitwise_and(x, x), do: x
  def range_bitwise_and(left, right) when band(bsl(left, 1), right) < left and bsl(left, 1) < right, do: 0
  def range_bitwise_and(left, right) do
    band(right, range_bitwise_and(left, right-1))
  end
end
