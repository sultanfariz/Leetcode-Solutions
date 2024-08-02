defmodule Solution do
  @spec max_sum(nums1 :: [integer], nums2 :: [integer], sum1 :: integer, sum2 :: integer) :: integer
  defp max_sum([], [], sum1, sum2) when sum1 > sum2, do: sum1
  defp max_sum([], [], sum1, sum2), do: sum2
  defp max_sum([a | b], [], sum1, sum2), do: max_sum(b, [], sum1+a, sum2)
  defp max_sum([], [c | d], sum1, sum2), do: max_sum([], d, sum1, sum2+c)
  defp max_sum([a | b], [c | d], sum1, sum2) when a < c, do: max_sum(b, [c | d], sum1+a, sum2)
  defp max_sum([a | b], [a | d], sum1, sum2) do
    max = if sum1 > sum2, do: sum1, else: sum2
    max + a + max_sum(b, d, 0, 0)
  end
  defp max_sum([a | b], [c | d], sum1, sum2), do: max_sum([a | b], d, sum1, sum2+c)

  @spec max_sum(nums1 :: [integer], nums2 :: [integer]) :: integer
  def max_sum(nums1, nums2), do: max_sum(nums1, nums2, 0, 0) |> rem(1000000007)
end
