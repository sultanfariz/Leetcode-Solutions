defmodule Solution do
  @spec smaller_numbers_than_current(nums :: [integer]) :: [integer]
  def smaller_numbers_than_current(nums) do
    Enum.map(nums, fn x -> 
      Enum.count(nums, fn y -> y < x end)
    end)
  end
end
