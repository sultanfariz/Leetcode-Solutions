defmodule Solution do
  @spec iter(s :: [String.t]) :: [String.t]
  defp iter([]), do: []
  defp iter([h, h, h | t]) do
    iter([h, h | t])
  end
  defp iter([a | t]) do
    [a] ++ [iter(t)]
  end

  @spec make_fancy_string(s :: String.t) :: String.t
  def make_fancy_string(s) do
    s
    |> String.graphemes
    |> iter
    |> Enum.join("")
  end
end
