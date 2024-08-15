defmodule Solution do
  @spec lemonade_change(bills :: [integer], fives :: integer, tens :: integer) :: boolean
  def lemonade_change([], _, _), do: true
  def lemonade_change([5 | t], fives, tens), do: lemonade_change(t, fives+1, tens)
  def lemonade_change([10 | t], fives, tens) when fives<1, do: false
  def lemonade_change([10 | t], fives, tens), do: lemonade_change(t, fives-1, tens+1)
  def lemonade_change([20 | t], fives, tens) when fives>=1 and tens>=1 do
    lemonade_change(t, fives-1, tens-1)
  end
  def lemonade_change([20 | t], fives, tens) when fives>=3, do: lemonade_change(t, fives-3, tens)
  def lemonade_change([20 | t], fives, tens), do: false

  @spec lemonade_change(bills :: [integer]) :: boolean
  def lemonade_change(bills), do: lemonade_change(bills, 0, 0)
end
