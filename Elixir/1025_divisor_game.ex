defmodule Solution do
  @spec divisor_game(n :: integer) :: boolean
  def divisor_game(n), do: rem(n, 2) == 0
end
