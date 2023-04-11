defmodule Solution do
  @spec num_jewels_in_stones(jewels :: String.t, stones :: String.t) :: integer
  def num_jewels_in_stones(jewels, stones) do
    jewels = String.graphemes(jewels)
    stones 
    |> String.graphemes()
    |> Enum.count(fn el -> el in jewels end)
  end
end
