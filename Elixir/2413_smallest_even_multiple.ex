defmodule Solution do
  @spec smallest_even_multiple(n :: integer) :: integer
  def smallest_even_multiple(n), do: if rem(n, 2) == 0, do: n, else: 2 * n
end
