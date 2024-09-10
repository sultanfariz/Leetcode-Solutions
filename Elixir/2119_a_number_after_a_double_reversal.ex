defmodule Solution do
  @spec is_same_after_reversals(num :: integer) :: boolean
  def is_same_after_reversals(0), do: true
  def is_same_after_reversals(num) do
    case rem(num, 10) do
      0 -> false
      _ -> true
    end
  end
end
