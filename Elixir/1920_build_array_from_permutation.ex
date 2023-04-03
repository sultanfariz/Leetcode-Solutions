defmodule Solution do
  @spec build_array(nums :: [integer]) :: [integer]
  def build_array(nums) do
    Enum.map(nums, fn(num) -> Enum.at(nums, num) end)
  end
end
