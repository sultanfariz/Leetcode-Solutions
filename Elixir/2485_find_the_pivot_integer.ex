defmodule Solution do
  @spec calc_progression(n :: integer) :: integer
  defp calc_progression(n), do: (n/2)*(2+(n-1))

  @spec rec_pivot_integer(n :: integer, x :: integer) :: integer
  defp rec_pivot_integer(_, 0), do: -1
  defp rec_pivot_integer(n, x) do
    if calc_progression(n)+x == 2*calc_progression(x) do
      x
    else
      rec_pivot_integer(n, x-1)
    end
  end

  @spec pivot_integer(n :: integer) :: integer
  def pivot_integer(n), do: rec_pivot_integer(n, n)
end
