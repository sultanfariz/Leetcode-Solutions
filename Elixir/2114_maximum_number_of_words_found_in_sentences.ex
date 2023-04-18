defmodule Solution do
  @spec most_words_found(sentences :: [String.t]) :: integer
  def most_words_found(sentences) do
    sentences
    |> Enum.map(&(&1 |> String.split(" ") |> Enum.count))
    |> Enum.max
  end
end
