defmodule Solution do
  @spec calculate_width([integer]) :: [integer]
  def calculate_width([]), do: []
  def calculate_width([a, b]), do: [b-a]
  def calculate_width([a, b | t]) do
    [b-a] ++ calculate_width([b | t])
  end

  @spec max_width_of_vertical_area(points :: [[integer]]) :: integer
  def max_width_of_vertical_area(points) do
    xArr = Enum.map(points, fn [x, _] -> x end)
    |> Enum.sort(:asc)
    |> calculate_width
    |> Enum.max
  end
end
