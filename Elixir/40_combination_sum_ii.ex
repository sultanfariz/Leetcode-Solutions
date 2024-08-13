defmodule Solution do
  @spec iter(candidates :: [integer], target :: integer, carry :: [integer]) :: [[integer]]
  defp iter(_, 0, carry), do: [Enum.reverse(carry)]
  defp iter([], _, _), do: []
  defp iter(_, target, _) when target < 0, do: []
  defp iter([h, h | t], target, carry) do
    iter([h | t], target-h, [h | carry]) ++ iter_duplicates([h, h | t], target, carry)
  end
  defp iter([h | t], target, carry), do: iter(t, target-h, [h | carry]) ++ iter(t, target, carry)

  @spec iter_duplicates(candidates :: [integer], target :: integer, carry :: [integer]) :: [[integer]]
  defp iter_duplicates([h, h | t], target, carry), do: iter_duplicates([h | t], target, carry)
  defp iter_duplicates(candidates, target, carry), do: iter(candidates, target, carry)

  @spec remove_duplicates(list :: [[integer]]) :: [[integer]]
  defp remove_duplicates([]), do: []
  defp remove_duplicates([a]), do: [a]
  defp remove_duplicates([a, a | t]), do: remove_duplicates([a | t])
  defp remove_duplicates([a, b | t]), do: [a | remove_duplicates([b | t])]

  @spec combination_sum2(candidates :: [integer], target :: integer) :: [[integer]]
  def combination_sum2(candidates, target) do
    candidates
    |> Enum.sort(:asc)
    |> iter(target, [])
    |> Enum.sort(:asc)
    |> remove_duplicates
  end
end
