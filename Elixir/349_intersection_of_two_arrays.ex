defmodule Solution do
  @spec intersection(nums1 :: [integer], nums2 :: [integer]) :: [integer]
  def intersection(nums1, nums2) do
    maps1 = Enum.reduce(nums1, %{}, fn (el, acc) -> 
      Map.update(acc, el, 1, fn acc -> acc end)
    end)
    maps2 = Enum.reduce(nums2, %{}, fn (el, acc) -> 
      Map.update(acc, el, 1, fn acc -> acc end)
    end)

    Enum.reduce(nums1, [], fn (el, acc) ->
      a = Map.fetch(maps1, el)
      b = Map.fetch(maps2, el)
      if a == b do
        acc ++ [el]
      else
        acc
      end
    end)
    |> Enum.frequencies
    |> Enum.map(fn {a, b} -> a end)
  end
end
