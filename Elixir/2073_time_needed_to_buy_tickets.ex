defmodule Solution do
  @spec time_required_to_buy(tickets :: [integer], k :: integer) :: integer
  def time_required_to_buy(tickets, k) do
    kTix = Enum.at(tickets, k) - 1
    projected = kTix * length(tickets)
    res = tickets
    |> Enum.with_index
    |> Enum.reduce(0, fn ({el,i}, acc) -> 
      cond do
        el <= kTix -> acc - (kTix - el)
        i <= k -> acc + 1
        true -> acc
      end
    end)
    res + projected
  end
end
