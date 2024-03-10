defmodule Solution do
  @spec traverse_arr(nums1 :: [integer], nums2 :: [integer], result :: [integer]) :: [integer]
  defp traverse_arr(_, [], res), do: res
  defp traverse_arr([], _, res), do: res
  defp traverse_arr([a | t1], [a | t2], [a | res]), do: traverse_arr(t1, t2, [a | res])
  defp traverse_arr([a | t1], [a | t2], res), do: traverse_arr(t1, t2, [a | res])
  defp traverse_arr([a | t1], [b | t2], res) when a > b, do: traverse_arr([a | t1], t2, res)
  defp traverse_arr([a | t1], [b | t2], res) when a < b, do: traverse_arr(t1, [b | t2], res)

  @spec intersection(nums1 :: [integer], nums2 :: [integer]) :: [integer]
  def intersection(nums1, nums2) do
    nums1 = nums1 |> Enum.sort(&(&1 < &2))
    nums2 = nums2 |> Enum.sort(&(&1 < &2))
    traverse_arr(nums1, nums2, [])
  end
end
