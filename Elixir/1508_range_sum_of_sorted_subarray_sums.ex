defmodule Solution do
  @spec subarray_sum(nums :: [integer], acc :: integer) :: [integer]
  defp subarray_sum([], _), do: []
  defp subarray_sum([h | t], acc), do: [acc+h | subarray_sum(t, acc+h)]

  @spec subarrays_sum(nums :: [integer]) :: [integer]
  defp subarrays_sum([]), do: []
  defp subarrays_sum([h | t]), do: subarray_sum([h | t], 0) ++ subarrays_sum(t)

  @spec left_right_sum(nums :: [integer], left :: integer, right :: integer, i :: integer) :: integer
  defp left_right_sum([], _, _ , _), do: 0
  defp left_right_sum([h | t], left, right, i) when i > right, do: 0
  defp left_right_sum([h | t], left, right, i) when i < left, do: left_right_sum(t, left, right, i+1)
  defp left_right_sum([h | t], left, right, i), do: h + left_right_sum(t, left, right, i+1)

  @spec range_sum(nums :: [integer], n :: integer, left :: integer, right :: integer) :: integer
  def range_sum(nums, n, left, right) do
    nums 
    |> subarrays_sum 
    |> Enum.sort(:asc)
    |> left_right_sum(left, right, 1)
    |> rem(1000000007)
  end
end
