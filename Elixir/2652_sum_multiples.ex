defmodule Solution do
  @spec sum_of_multiples(n :: integer) :: integer
  def sum_of_multiples(1), do: 0
  def sum_of_multiples(n) do
    cond do
      rem(n, 3) == 0 -> n + sum_of_multiples(n-1)
      rem(n, 5) == 0 -> n + sum_of_multiples(n-1)
      rem(n, 7) == 0 -> n + sum_of_multiples(n-1)
      true -> sum_of_multiples(n-1)
    end
  end
end
