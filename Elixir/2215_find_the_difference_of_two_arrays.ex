defmodule Solution do
  @spec find_difference(nums1 :: [integer], nums2 :: [integer], res1 :: [integer], res2 :: [integer]) :: [[integer]]
  defp find_difference([], [], res1, res2), do: [res1, res2]
  defp find_difference([a | [a | c]], nums2, res1, res2), do: find_difference([a | c], nums2, res1, res2)
  defp find_difference(nums1, [a | [a | c]], res1, res2), do: find_difference(nums1, [a | c], res1, res2)
  defp find_difference([a | b], [], res1, res2), do: find_difference(b, [], res1 ++ [a], res2)
  defp find_difference([], [c | d], res1, res2), do: find_difference([], d, res1, res2 ++ [c])
  defp find_difference([a | b], [a | d], res1, res2), do: find_difference(b, d, res1, res2)
  defp find_difference([a | b], [c | d], res1, res2) when a > c, do: find_difference([a | b], d, res1, res2 ++ [c])
  defp find_difference([a | b], [c | d], res1, res2) when a < c, do: find_difference(b, [c | d], res1 ++ [a], res2)

  @spec find_difference(nums1 :: [integer], nums2 :: [integer]) :: [[integer]]
  def find_difference(nums1, nums2) do
    nums1 = nums1 |> Enum.sort(:asc)
    nums2 = nums2 |> Enum.sort(:asc)
    find_difference(nums1, nums2, [], [])
  end
end
