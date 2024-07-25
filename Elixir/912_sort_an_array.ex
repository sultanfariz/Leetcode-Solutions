defmodule Solution do
  @spec merge_array(first :: [integer], second :: [integer]) :: [integer]
  def merge_array(first, []), do: first
  def merge_array([], second), do: second
  def merge_array([a | b], [c | d]) when a < c, do: [a | merge_array(b, [c | d])]
  def merge_array([a | b], [c | d]), do: [c | merge_array([a | b], d)]

  @spec sort_array(nums :: [integer]) :: [integer]
  def sort_array([num]), do: [num]
  def sort_array(nums) do
    len = length(nums)
    n = if rem(len, 2) == 0, do: div(len, 2), else: div(len, 2)+1
    left = nums |> Enum.take(n) |> sort_array
    right = nums |> Enum.take(-div(len,2)) |> sort_array
    merge_array(left, right)
  end
end
