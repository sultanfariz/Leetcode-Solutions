defmodule Solution do
  @spec sort_list(list :: [integer]) :: [integer]
  defp sort_list(list) do
    list |> Enum.sort(&(&1 < &2))
  end

  @spec compare_list(first :: [integer], second :: [integer], acc :: integer) :: [integer]
  def compare_list([], [], acc), do: acc
  def compare_list([a | b], [c | d], acc) do
    case a == c do
      false -> compare_list(b, d, acc + 1)
      _ -> compare_list(b, d, acc)
    end
  end

  @spec height_checker(heights :: [integer]) :: integer
  def height_checker(heights) do
    correct = sort_list(heights)
    compare_list(heights, correct, 0)
  end
end
