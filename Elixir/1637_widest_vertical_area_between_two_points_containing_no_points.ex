defmodule Solution do
  @spec max_width_of_vertical_area(points :: [[integer]]) :: integer
  def max_width_of_vertical_area(points) do
    xArr = Enum.map(points, fn [x, _] -> x end)
    |> Enum.sort(:asc)

    xArrDuplicate = xArr ++ [List.last(xArr)]

    xArr
    |> Enum.with_index
    |> Enum.reduce([], fn ({el, i}, acc) ->
        acc ++ [Enum.at(xArrDuplicate, i+1) - el]
    end)
    |> Enum.max
  end
end
