defmodule Solution do
  @spec final_position_of_snake(n :: integer, commands :: [String.t]) :: integer
  def final_position_of_snake(n, []), do: 0
  def final_position_of_snake(n, ["RIGHT" | commands]), do: final_position_of_snake(n, commands) + 1
  def final_position_of_snake(n, ["LEFT" | commands]), do: final_position_of_snake(n, commands) - 1
  def final_position_of_snake(n, ["UP" | commands]), do: final_position_of_snake(n, commands) - n
  def final_position_of_snake(n, ["DOWN" | commands]), do: final_position_of_snake(n, commands) + n
end
