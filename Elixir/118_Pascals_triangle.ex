defmodule Solution do
  @spec generate(num_rows :: integer, n :: integer, prev :: [integer]) :: [[integer]]
  defp generate(num_rows, n, prev) when num_rows < n, do: []
  defp generate(num_rows, 1, _), do: [[1] | generate(num_rows, 2, [1])]
  defp generate(num_rows, 2, _), do: [[1,1] | generate(num_rows, 3, [1,1])]
  defp generate(num_rows, n, prev) do
    row = [1 | generate_row(prev) ++ [1]]
    [row | generate(num_rows, n+1, row)]
  end

  @spec generate_row(prev :: [integer]) :: [integer]
  defp generate_row([a, b]), do: [a+b]
  defp generate_row([a, b | t]), do: [a+b | generate_row([b|t])]

  @spec generate(num_rows :: integer) :: [[integer]]
  def generate(num_rows), do: generate(num_rows, 1, [])
end
