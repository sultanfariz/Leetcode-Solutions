defmodule Solution do
  @spec min_steps(n :: integer, i :: integer) :: integer
  def min_steps(n, i) when i*i > n, do: n
  def min_steps(n, i) when rem(n, i) == 0, do: i + min_steps(div(n,i))
  def min_steps(n, i), do: min_steps(n, i+1)

  @spec min_steps(n :: integer) :: integer
  def min_steps(1), do: 0
  def min_steps(n), do: min_steps(n,2)
end
