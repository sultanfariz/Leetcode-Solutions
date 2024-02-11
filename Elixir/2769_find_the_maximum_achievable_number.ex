defmodule Solution do
  @spec the_maximum_achievable_x(num :: integer, t :: integer) :: integer
  def the_maximum_achievable_x(num, t) do
    num + (t * 2)
  end
end
