defmodule Solution do
  @spec intersect(nums1 :: [integer], nums2 :: [integer], res :: [integer]) :: [integer]
  defp intersect(_, [], res), do: res
  defp intersect([], _, res), do: res
  defp intersect([a | b], [a | d], res), do: intersect(b, d, res ++ [a])
  defp intersect([a | b], [c | d], res) when a < c, do: intersect(b, [c | d], res)
  defp intersect([a | b], [c | d], res) when a > c, do: intersect([a | b], d, res)

  @spec intersect(nums1 :: [integer], nums2 :: [integer]) :: [integer]
  def intersect(nums1, nums2) do
    nums1 = nums1 |> Enum.sort(:asc)
    nums2 = nums2 |> Enum.sort(:asc)
    intersect(nums1, nums2, [])
  end
end
