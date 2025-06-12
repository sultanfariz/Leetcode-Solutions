defmodule Solution do
  @spec max_adjacent_distance(nums :: [integer], max :: integer) :: integer
  defp max_adjacent_distance([], max), do: max
  defp max_adjacent_distance([a], max), do: max
  defp max_adjacent_distance([a, b | t], max) do
    diff = abs(a, b)
    if diff > max do
      max_adjacent_distance([b | t], diff)
    else
      max_adjacent_distance([b | t], max)
    end
  end

  @spec abs(a :: integer, b :: integer) :: integer
  defp abs(a, b) when a > b, do: a - b
  defp abs(a, b), do: b - a

  @spec max_adjacent_distance(nums :: [integer]) :: integer
  def max_adjacent_distance(nums) do
    max_adjacent_distance(nums ++ [Enum.at(nums, 0)], 0)
  end
end
