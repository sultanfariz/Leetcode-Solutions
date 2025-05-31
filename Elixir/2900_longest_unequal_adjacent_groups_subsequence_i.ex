defmodule Solution do
  @spec get_longest_subsequence(words :: [String.t], groups :: [integer], last :: integer) :: [integer]
  defp get_longest_subsequence([], [], _), do: []
  defp get_longest_subsequence([a | b], [c | d], c), do: get_longest_subsequence(b, d, c)
  defp get_longest_subsequence([a | b], [c | d], 0), do: [a | get_longest_subsequence(b, d, 1)]
  defp get_longest_subsequence([a | b], [c | d], 1), do: [a | get_longest_subsequence(b, d, 0)]

  @spec get_longest_subsequence(words :: [String.t], groups :: [integer]) :: [String.t]
  def get_longest_subsequence(words, groups) do
    w1 = Enum.at(words, 0)
    g1 = Enum.at(groups, 0)
    [w1 | get_longest_subsequence(words, groups, g1)]
  end
end
