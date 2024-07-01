defmodule Solution do
  @spec traverse_graph(edges :: [[integer]], nodes :: [integer]) :: integer
  defp traverse_graph([[a, b] | t], [0, 0]), do: traverse_graph(t, [a, b])
  defp traverse_graph([[a, b] | t], [a, _]), do: a
  defp traverse_graph([[a, b] | t], [_, a]), do: a
  defp traverse_graph([[a, b] | t], [b, _]), do: b
  defp traverse_graph([[a, b] | t], [_, b]), do: b

  @spec find_center(edges :: [[integer]]) :: integer
  def find_center(edges) do
    traverse_graph(edges, [0, 0])
  end
end
