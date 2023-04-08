defmodule Solution do
  @spec final_value_after_operations(operations :: [String.t]) :: integer
  def final_value_after_operations(operations) do
    Enum.reduce(operations, 0, fn (op, acc) ->
        case op do
          "++X" -> acc + 1
          "X++" -> acc + 1
          "--X" -> acc - 1
          "X--" -> acc - 1
        end
    end)
  end
end
