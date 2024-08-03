defmodule Solution do
  @spec iter(target :: [integer], arr :: [integer]) :: boolean
  defp iter([], []), do: true
  defp iter([], _), do: false
  defp iter(_, []), do: false
  defp iter([a | b], [a | d]), do: iter(b, d)
  defp iter([a | b], [c | d]), do: false

  @spec can_be_equal(target :: [integer], arr :: [integer]) :: boolean
  def can_be_equal(target, arr) do
    target = target |> Enum.sort(:asc)
    arr = arr |> Enum.sort(:asc)
    iter(target, arr)
  end
end
