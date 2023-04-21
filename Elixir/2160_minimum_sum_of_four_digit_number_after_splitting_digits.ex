defmodule Solution do
  @spec minimum_sum(num :: integer) :: integer
  def minimum_sum(num) do
    [a, b, c, d] = split_to_arr(num, []) |> Enum.sort(:asc)
    ((a * 10) + c) + ((b * 10) + d)
  end

  @spec split_to_arr(num :: integer, arr :: [integer]) :: integer
  def split_to_arr(num, arr) when num < 10, do: [num | arr]
  def split_to_arr(num, arr) do
    split_to_arr(div(num, 10), [rem(num, 10) | arr])
  end
end
