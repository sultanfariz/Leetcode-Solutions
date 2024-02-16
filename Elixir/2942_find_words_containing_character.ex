defmodule Solution do
  @spec find_words_containing([String.t()], x :: char) :: boolean
  def find_word_containing([], _), do: false
  def find_word_containing([a], x) do
    if a === List.to_string([x]) do
        true
    else
        false
    end
  end
  def find_word_containing([a | t], x) do
    if find_word_containing([a], x) == true do
        true
    else
        find_word_containing(t, x)
    end
  end

  @spec find_words_containing(words :: [String.t], x :: char) :: [integer]
  def find_words_containing(words, x) do
    words
    |> Enum.with_index
    |> Enum.filter(fn({el, i}) -> 
        find_word_containing(String.graphemes(el), x) == true
    end)
    |> Enum.map(fn {_, i} -> i end)
  end
end
