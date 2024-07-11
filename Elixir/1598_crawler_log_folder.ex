defmodule Solution do
  @spec min_operations(logs :: [String.t], depth :: integer) :: integer
  defp min_operations([], depth), do: depth
  defp min_operations([h | t], depth) do
    depth = case h do
      "../" -> depth - 1
      "./" -> depth
      _ -> depth + 1
    end
    depth = if depth < 0, do: 0, else: depth

    min_operations(t, depth)
  end

  @spec min_operations(logs :: [String.t]) :: integer
  def min_operations(logs), do: min_operations(logs, 0)
end
