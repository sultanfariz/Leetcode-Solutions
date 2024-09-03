defmodule Solution do
  @spec search_insert(nums :: [integer], target :: integer, left :: integer, right :: integer) :: integer
  defp search_insert(nums, target, left, right) do
    mid = div(left + right, 2)
    cond do
      mid == left and left == right -> mid
      Enum.at(nums, mid) == target -> mid
      Enum.at(nums, mid) > target -> search_insert(nums, target, left, mid)
      mid == left -> mid+1
      Enum.at(nums, mid) < target -> search_insert(nums, target, mid, right)
    end
  end

  @spec search_insert(nums :: [integer], target :: integer) :: integer
  def search_insert(nums, target) do
    search_insert(nums, target, 0, length(nums))
  end
end
