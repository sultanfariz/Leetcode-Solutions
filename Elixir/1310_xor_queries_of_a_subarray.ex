defmodule Solution do
  import Bitwise, only: [bxor: 2]

  @spec prefix(arr :: [integer], curr :: integer) :: [integer]
  defp prefix([], curr), do: [curr]
  defp prefix([h | t], curr) do
    curr = bxor(curr, h)
    [curr | prefix(t, curr)]
  end

  @spec xor_queries(pref :: [integer], arr :: [integer], queries :: [[integer]]) :: [integer]
  defp xor_queries(_, _, []), do: []
  defp xor_queries(pref, arr, [h | t]) do
    i = h |> Enum.at(0)
    j = h |> Enum.at(1)
    res = bxor(Enum.at(pref, i), Enum.at(pref, j))
    res = bxor(Enum.at(arr, i), res)
    [res | xor_queries(pref, arr, t)]
  end

  @spec xor_queries(arr :: [integer], queries :: [[integer]]) :: [integer]
  def xor_queries(arr, queries) do
    arr 
    |> prefix(0)
    |> xor_queries(arr, queries)
  end
end
