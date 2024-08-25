defmodule Solution do
  @spec max_profit(prices :: [integer], min :: integer, profit :: integer) :: integer
  defp max_profit([], _, profit), do: profit
  defp max_profit([h | t], min, profit) when h < min, do: max_profit(t, h, profit)
  defp max_profit([h | t], min, profit) when h-min > profit, do: max_profit(t, min, h-min)
  defp max_profit([h | t], min, profit), do: max_profit(t, min, profit)

  @spec max_profit(prices :: [integer]) :: integer
  def max_profit(prices) do
    max_profit(prices, Enum.at(prices, 0), 0)
  end
end
