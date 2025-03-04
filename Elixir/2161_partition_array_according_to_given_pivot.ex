defmodule Solution do
  @spec pivot_array(nums :: [integer], pivot :: integer, s :: [integer], pvt :: [integer], g :: [integer]) :: {[integer], [integer], [integer]}
  defp pivot_array([], _, s, pvt, g), do: {s, pvt, g}
  defp pivot_array([h | t], h, s, pvt, g) do
    pivot_array(t, h, s, [h | pvt], g)
  end
  defp pivot_array([h | t], pivot, s, pvt, g) when h > pivot do
    pivot_array(t, pivot, s, pvt, [h | g])
  end
  defp pivot_array([h | t], pivot, s, pvt, g) do
    pivot_array(t, pivot, [h | s], pvt, g)
  end

  @spec pivot_array(nums :: [integer], pivot :: integer) :: [integer]
  def pivot_array(nums, pivot) do
    {s, pvt, g} = pivot_array(nums, pivot, [], [], [])
    Enum.reverse(s) ++ Enum.reverse(pvt) ++ Enum.reverse(g)
  end
end
