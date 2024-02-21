defmodule Solution do
  @spec missing_number(nums :: [integer]) :: integer
  def missing_number(nums) do
    n = length(nums)
    ((n/2)*(2+(n-1))) - Enum.sum(nums)
    |> trunc
  end
end
