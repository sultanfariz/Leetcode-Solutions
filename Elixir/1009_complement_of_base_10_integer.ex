defmodule Solution do
  @spec power_two_above(target :: integer, counter :: integer) :: integer
  defp power_two_above(target, counter) when counter > target, do: counter
  defp power_two_above(target, counter), do: power_two_above(target, counter*2)

  @spec bitwise_complement(n :: integer) :: integer
  def bitwise_complement(n) do
    power_two_above(n, 2) - n - 1
  end
end
