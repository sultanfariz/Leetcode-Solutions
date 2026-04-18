defmodule Solution do
  @spec list_to_map(hashmap :: map(), list :: [integer]) :: map()
  defp list_to_map(hashmap, []), do: hashmap
  defp list_to_map(hashmap, [h | t]) do
    new_hashmap = Map.put(hashmap, h, h)
    list_to_map(new_hashmap, t)
  end

  @spec recover_order_rec(hashmap :: map(), friends :: [integer]) :: [integer]
  defp recover_order_rec(_, []), do: []
  defp recover_order_rec(hashmap, [h | t]) do
    val = Map.get(hashmap, h) 
    if val != nil do
      [Map.get(hashmap, h)] ++ recover_order_rec(hashmap, t)
    else 
      recover_order_rec(hashmap, t)
    end
  end

  @spec recover_order(order :: [integer], friends :: [integer]) :: [integer]
  def recover_order(order, friends) do
    hashmap = %{} |> list_to_map(friends)
    recover_order_rec(hashmap, order) 
  end
end
