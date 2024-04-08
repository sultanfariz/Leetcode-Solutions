defmodule Solution do
  @spec count_students(students :: [integer], sandwiches :: [integer], zero :: integer, one :: integer) :: integer
  defp count_students([], [], 0, 0), do: 0
  defp count_students(_, [0 | _], 0, one), do: one
  defp count_students(_, [1 | _], zero, 0), do: zero
  defp count_students([0 | b], [0 | d], zero, one), do: count_students(b, d, zero-1, one)
  defp count_students([1 | b], [1 | d], zero, one), do: count_students(b, d, zero, one-1)
  defp count_students([a | b], [c | d], zero, one) when a !== c, do: count_students(b++[a], [c | d], zero, one)

  @spec count_students(students :: [integer], sandwiches :: [integer]) :: integer
  def count_students(students, sandwiches) do
    [zero, one] = students |> Enum.with_index |> Enum.reduce([0, 0], fn 
        {0, _}, [a, b] ->[a+1, b]
        {1, _}, [a,b] -> [a, b+1]
    end)
    count_students(students, sandwiches, zero, one)
  end
end
