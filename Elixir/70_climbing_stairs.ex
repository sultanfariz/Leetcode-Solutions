defmodule Solution do
  @spec climb_stairs(n :: integer, prev1 :: integer, prev2 :: integer) :: integer
  defp climb_stairs(n, prev1, prev2) when n <= 0, do: prev2
  defp climb_stairs(n, prev1, prev2), do: climb_stairs(n-1, prev2, prev1 + prev2)

  @spec climb_stairs(n :: integer) :: integer
  def climb_stairs(n), do: climb_stairs(n, 0, 1)
end
