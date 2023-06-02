defmodule Solution do
  @spec sort_the_students(score :: [[integer]], k :: integer) :: [[integer]]
  def sort_the_students(score, k) do
    score
    |> Enum.reduce([], fn (el, acc) -> 
      acc = acc ++ [Enum.at(el, k)]
    end)
    |> Enum.with_index
    |> Enum.sort(fn ({x, _}, {y, _}) -> x > y end)
    |> Enum.reduce([], fn ({el, i}, acc) -> 
      acc = acc ++ [Enum.at(score, i)]
    end)
  end
end
