defmodule Solution do
  @spec iterate_arr(arr :: [integer], count :: integer) :: boolean
  defp iterate_arr(_, 3), do: true
  defp iterate_arr([], _), do: false
  defp iterate_arr([h | t], count) when rem(h,2) == 1, do: iterate_arr(t, count+1)
  defp iterate_arr([h | t], count), do: iterate_arr(t, 0)

  @spec three_consecutive_odds(arr :: [integer]) :: boolean
  def three_consecutive_odds(arr) do
    iterate_arr(arr, 0)
  end
end
