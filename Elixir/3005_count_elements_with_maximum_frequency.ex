defmodule Solution do
  @spec count_elem(nums :: [integer], countMap :: map()) :: map()
  defp count_elem([], countMap), do: countMap
  defp count_elem([a | t], countMap) do
    countMap = Map.update(countMap, a, 1, fn existing_value -> existing_value + 1 end)
    count_elem(t, countMap)
  end

  @spec max_frequency_elements(nums :: [integer]) :: integer
  def max_frequency_elements(nums) do
    count_elem(nums, %{})
    |> Enum.reduce({0, 0}, fn ({_, v}, {max, sum}) ->
      cond do
        v > max -> {v, v}
        v == max -> {max, sum + v}
        v < max -> {max, sum}
      end
    end)
    |> elem(1)
  end
end
