defmodule Solution do
  @spec max_depth(s :: [String.t], depth :: integer, maxDepth :: integer) :: integer
  defp max_depth([], _, maxDepth), do: maxDepth
  defp max_depth(["(" | t], depth, maxDepth) when depth == maxDepth, do: max_depth(t, depth+1, depth+1)
  defp max_depth(["(" | t], depth, maxDepth), do: max_depth(t, depth+1, maxDepth)
  defp max_depth([")" | t], depth, maxDepth), do: max_depth(t, depth-1, maxDepth)
  defp max_depth([_ | t], depth, maxDepth), do: max_depth(t, depth, maxDepth)

  @spec max_depth(s :: String.t) :: integer
  def max_depth(s), do: s |> String.graphemes |> max_depth(0, 0)
end
