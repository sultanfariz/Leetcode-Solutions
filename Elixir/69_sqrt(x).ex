defmodule Solution do
  @spec my_sqrt(x :: integer, left :: integer, right :: integer) :: integer
  defp my_sqrt(x, left, right) do
    mid = div(left + right, 2)
    cond do
      mid == left -> mid
      mid * mid == x -> mid
      mid * mid < x -> my_sqrt(x, mid, right)
      mid * mid > x -> my_sqrt(x, left, mid)
    end
  end

  @spec my_sqrt(x :: integer) :: integer
  def my_sqrt(x), do: my_sqrt(x, 1, x)
end
