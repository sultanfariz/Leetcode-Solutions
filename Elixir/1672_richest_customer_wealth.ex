defmodule Solution do
  @spec maximum_wealth(accounts :: [[integer]]) :: integer
  def maximum_wealth(accounts) do
    Enum.reduce(accounts, 0, fn (el, acc) -> 
      if Enum.sum(el) > acc, do: Enum.sum(el), else: acc
    end)
  end
end
