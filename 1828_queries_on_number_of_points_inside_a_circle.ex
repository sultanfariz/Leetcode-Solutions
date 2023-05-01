defmodule Solution do
  import :math, only: [sqrt: 1]

  @spec count_points(points :: [[integer]], queries :: [[integer]]) :: [integer]
  def count_points(points, queries) do
    Enum.reduce(queries, [], fn (query, acc) -> acc ++ [compare_dist(points, query)] end)
  end

  @spec compare_dist(points :: [[integer]], query :: [integer]) :: integer
  def compare_dist(points, query) do
    Enum.reduce(points, 0, fn (point, acc) ->
        if count_dist(point, query) <= Enum.at(query, 2), do: acc + 1, else: acc
    end)
  end

  @spec count_dist(point :: [integer], query :: [integer]) :: float
  def count_dist(point, query) do
    sqrt(Integer.pow(abs(Enum.at(point, 0) - Enum.at(query, 0)), 2) + Integer.pow(abs(Enum.at(point, 1) - Enum.at(query, 1)), 2))
  end
end
