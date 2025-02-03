defmodule Solution do
  @spec check(nums :: [integer], counter :: integer) :: boolean
  defp check(_, 2), do: false
  defp check([_], n) when n < 2, do: true
  defp check([a, b | t], n) when a > b, do: check([b | t], n+1)
  defp check([a, b | t], n), do: check([b | t], n)

  @spec check(nums :: [integer]) :: boolean
  def check(nums) do
    check(nums ++ [Enum.at(nums, 0)], 0)
  end
end
