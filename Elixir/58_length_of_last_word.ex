defmodule Solution do
  @spec traverse_words(s :: [String.t], count :: integer) :: integer
  defp traverse_words([], count), do: count
  defp traverse_words([" ", h | t], _) when h !== " ", do: traverse_words([h | t], 0)
  defp traverse_words([" " | t], count), do: traverse_words(t, count)
  defp traverse_words([h | t], count), do: traverse_words(t, count+1)

  @spec length_of_last_word(s :: String.t) :: integer
  def length_of_last_word(s) do
    s
    |> String.graphemes()
    |> traverse_words(0)
  end
end
