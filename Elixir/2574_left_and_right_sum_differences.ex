defmodule Solution do
  @spec left_rigth_difference(nums :: [integer]) :: [integer]
  def left_rigth_difference(nums) do
    left_rigth_difference(nums, 0, Enum.sum(nums), [])
  end
  
  @spec left_rigth_difference(nums :: [integer], left_sum :: integer, right_sum :: integer, res :: [integer]) :: [integer]
  def left_rigth_difference([head | tail], left_sum, right_sum, res) do
    left_sum = left_sum + head
    left_rigth_difference(tail, left_sum, right_sum - head, res ++ [abs(right_sum - left_sum)])
  end

  def left_rigth_difference([], _, _, res) do
    res
  end
end
