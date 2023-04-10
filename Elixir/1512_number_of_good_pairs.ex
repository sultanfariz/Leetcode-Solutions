defmodule Solution do
  @spec num_identical_pairs(nums :: [integer]) :: integer
  def num_identical_pairs(nums) do
    Enum.reduce(nums, %{}, fn(el, acc) -> 
        Map.update(acc, el, [0, 0], fn [tot, acl] -> [tot + acl + 1, acl + 1] end)
    end)
    |> Map.values() 
    |> Enum.reduce(0, fn ([tot, acl], acc) -> acc + tot end)
  end
end
