defmodule Solution do
  @spec max_increase_keeping_skyline(grid :: [[integer]]) :: integer
  def max_increase_keeping_skyline(grid) do
    west_contour = grid |> contours
    north_contour = grid |> transpose |> contours
    max_grid = max_matrix(west_contour, north_contour)
    sum_matrix(max_grid) - sum_matrix(grid)
  end

  @spec transpose(grid :: [[integer]]) :: [[integer]]
  def transpose(grid), do: Enum.zip_with(grid, &(&1))

  @spec contours(grid :: [[integer]]) :: [[integer]]
  def contours(grid) do
    Enum.reduce(grid, [], fn (el, acc) -> 
      acc ++ [Enum.max(el)]
    end)
  end

  @spec max_matrix(first :: [integer], second :: [integer]) :: [[integer]]
  def max_matrix(first, second) do
    Enum.reduce(first, [], fn (el1, acc) -> 
      acc ++ [
        Enum.reduce(second, [], fn (el2, acc) -> 
          acc ++ [min(el1, el2)]
        end)
      ]
    end)
  end

  @spec sum_matrix(matrix :: [[integer]]) :: integer
  def sum_matrix(matrix), do: Enum.reduce(matrix, 0, fn (el, acc) ->  acc + Enum.sum(el) end)
end
