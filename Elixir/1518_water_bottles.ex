defmodule Solution do
  defp iter([full, empty], num_exchange) when full + empty < num_exchange, do: full
  defp iter([full, empty], num_exchange) do
    remain = rem((full + empty), num_exchange)
    divided = div((full + empty), num_exchange)
    full + iter([divided, remain], num_exchange)
  end

  @spec num_water_bottles(num_bottles :: integer, num_exchange :: integer) :: integer
  def num_water_bottles(num_bottles, num_exchange) do
    remain = rem(num_bottles, num_exchange)
    divided = div(num_bottles, num_exchange)
    num_bottles + iter([divided, remain], num_exchange)
  end
end
