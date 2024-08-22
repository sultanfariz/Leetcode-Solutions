defmodule Solution do
  @spec power_two_above(target :: integer, counter :: integer) :: integer
  defp power_two_above(target, counter) when counter > target, do: counter
  defp power_two_above(target, counter), do: power_two_above(target, counter*2)

  @spec find_complement(num :: integer) :: integer
  def find_complement(num) do
    power_two_above(num, 2) - num - 1
  end
end
