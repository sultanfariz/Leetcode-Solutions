defmodule Solution do
  @spec traverse_arr(nums :: [integer], maps1 :: map(), maps2 :: map()) :: integer
  def traverse_arr([], _, _), do: -1
  def traverse_arr([a | t], maps1, maps2) do
    if Map.fetch(maps1, a) == Map.fetch(maps2, a) do
      a
    else
      traverse_arr(t, maps1, maps2)
    end
  end

  @spec get_common(nums1 :: [integer], nums2 :: [integer]) :: integer
  def get_common(nums1, nums2) do
    maps1 = Enum.reduce(nums1, %{}, fn(el, acc) -> 
      Map.update(acc, el, 1, fn acc -> acc end)
    end)
    maps2 = Enum.reduce(nums2, %{}, fn(el, acc) -> 
      Map.update(acc, el, 1, fn acc -> acc end)
    end)

    traverse_arr(nums1, maps1, maps2)
  end
end
