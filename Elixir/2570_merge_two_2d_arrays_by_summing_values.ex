defmodule Solution do
  @spec merge_arrays(nums1 :: [[integer]], nums2 :: [[integer]]) :: [[integer]]
  def merge_arrays([], []), do: []
  def merge_arrays(nums1, []), do: nums1
  def merge_arrays([], nums2), do: nums2
  def merge_arrays([[a, b] | c], [[a, e] | f]) do
    [[a, b+e]] ++ merge_arrays(c, f)
  end
  def merge_arrays([[a, b] | c], [[d, e] | f]) when a < d do
    [[a, b]] ++ merge_arrays(c, [[d, e] | f])
  end
  def merge_arrays([[a, b] | c], [[d, e] | f]) do
    [[d, e]] ++ merge_arrays([[a, b] | c], f)
  end
end
