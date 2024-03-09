defmodule Solution do
  @spec get_common(nums1 :: [integer], nums2 :: [integer]) :: integer
  def get_common(_, []), do: -1
  def get_common([], _), do: -1
  def get_common([a | t1], [b | t2]) do
    cond do
      a > b -> get_common([a | t1], t2)
      a < b -> get_common(t1, [b | t2])
      a == b -> ax
    end
  end
end
