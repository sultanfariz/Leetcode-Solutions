defmodule Solution do
  @spec iter(arrays :: [integer], min :: integer, max :: integer) :: [integer]
  defp iter([], min, max), do: [min, max]
  defp iter([h | t], min, max) when h > max, do: iter(t, min, h)
  defp iter([h | t], min, max) when h < min, do: iter(t, h, max)
  defp iter([_ | t], min, max), do: iter(t, min, max)

  @spec min_max(arrays :: [[integer]], min :: integer, max :: integer) :: [[integer]]
  defp min_max([h], min, max) do
    [iter(h, min, max)]
  end
  defp min_max([h | t], min, max) do
    first = t |> Enum.at(0) |> Enum.at(0)
    [iter(h, min, max) | min_max(t, first, first)]
  end

  @spec two_max(arrays :: [[integer]], max1 :: [integer], max2 :: [integer], counter :: integer) :: [[integer]]
  defp two_max(arrays, [max1, i1], [max2, i2], counter) when max1 < max2 do
    two_max(arrays, [max2, i2], [max1, i1], counter)
  end
  defp two_max([], [max1, i1], [max2, i2], _), do: [[max1, i1], [max2, i2]]
  defp two_max([[_, b] | t], max1, [max2, _], counter) when b > max2 do
    two_max(t, max1, [b, counter], counter+1)
  end
  defp two_max([_ | t], max1, max2, counter), do: two_max(t, max1, max2, counter+1)

  @spec two_min(arrays :: [[integer]], min1 :: [integer], min2 :: [integer], counter :: integer) :: [[integer]]
  defp two_min(arrays, [min1, i1], [min2, i2], counter) when min1 > min2 do
    two_min(arrays, [min2, i2], [min1, i1], counter)
  end
  defp two_min([], [min1, i1], [min2, i2], _), do: [[min1, i1], [min2, i2]]
  defp two_min([[a, _] | t], min1, [min2, _], counter) when a < min2 do
    two_min(t, min1, [a, counter], counter+1)
  end
  defp two_min([_ | t], min1, min2, counter), do: two_min(t, min1, min2, counter+1)

  @spec calc_max_distance(arrays :: [[integer]]) :: integer
  defp calc_max_distance([[min1, max1], [min2, max2] | t]) do
    [[max1, imax], [max2, _]] = two_max(t, [max1, 0], [max2, 1], 2)
    [[min1, imin], [min2, _]] = two_min(t, [min1, 0], [min2, 1], 2)
    if imax != imin, do: max1 - min1, else: max(max2-min1, max1-min2)
  end

  @spec max_distance(arrays :: [[integer]]) :: integer
  def max_distance(arrays) do
    first = arrays |> Enum.at(0) |> Enum.at(0)
    min_max(arrays, first, first)
    |> calc_max_distance
  end
end
