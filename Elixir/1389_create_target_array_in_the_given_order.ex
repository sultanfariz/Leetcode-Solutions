defmodule Solution do
  @spec create_target_array(nums :: [integer], index :: [integer]) :: [integer]
  def create_target_array(nums, index) do
    nums
    |> Enum.with_index
    |> Enum.reduce([], fn ({el, i}, acc) ->
      List.insert_at(acc, Enum.at(index, i), el)
    end)
  end
end
