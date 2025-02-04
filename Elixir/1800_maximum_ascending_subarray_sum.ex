defmodule Solution do
  @spec max_ascending_sum(nums :: [integer], cum :: integer, max :: integer, flag :: boolean) :: integer
  defp max_ascending_sum(nums, cum, max, flag) when cum > max do
    max_ascending_sum(nums, cum, cum, flag)
  end
  defp max_ascending_sum([], _, max, _), do: max
  defp max_ascending_sum([a], cum, max, true) do
    max_ascending_sum([], cum+a, max, true)
  end
  defp max_ascending_sum([a], cum, max, false) do
    max_ascending_sum([], cum, max, false)
  end
  defp max_ascending_sum([a, b | t], cum, max, true) when a < b do
    max_ascending_sum([b | t], cum+a, max, true)
  end
  defp max_ascending_sum([a, b | t], cum, max, true) do
    max_ascending_sum([b | t], cum+a, max, false)
  end
  defp max_ascending_sum([a, b | t], _, max, false) when a < b do
    max_ascending_sum([b | t], a, max, true)
  end
  defp max_ascending_sum([a, b | t], _, max, false) do
    max_ascending_sum([b | t], a, max, false)
  end

  @spec max_ascending_sum(nums :: [integer]) :: integer
  def max_ascending_sum(nums) do
    max_ascending_sum(nums, 0, 0, true)
  end
end
