defmodule Solution do
  @spec maximum(pos :: integer, neg :: integer) :: integer
  defp maximum(pos, neg) when pos > neg, do: pos
  defp maximum(_, neg), do: neg

  @spec maximum_count(nums :: [integer], pos :: integer, neg :: integer) :: integer
  defp maximum_count([], pos, neg), do: maximum(pos, neg)
  defp maximum_count([0 | t], pos, neg), do: maximum_count(t, pos, neg)
  defp maximum_count([h | t], pos, neg) when h > 0, do: maximum_count(t, pos+1, neg)
  defp maximum_count([h | t], pos, neg), do: maximum_count(t, pos, neg+1)

  @spec maximum_count(nums :: [integer]) :: integer
  def maximum_count(nums) do
    maximum_count(nums, 0, 0)
  end
end
