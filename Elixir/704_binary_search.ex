defmodule Solution do
  @spec search(nums :: [integer], target :: integer, start_index :: integer) :: integer
  defp search([], _, _), do: -1
  defp search(nums, target, idx) do
    mid = nums |> length |> div(2)
    midEl = nums |> Enum.at(mid)
    cond do
      target == midEl -> idx + mid
      target < midEl -> search(Enum.slice(nums, 0, mid), target, idx)
      target > midEl -> search(Enum.slice(nums, mid+1, mid), target, idx+mid+1)
    end
  end

  @spec search(nums :: [integer], target :: integer) :: integer
  def search(nums, target), do: search(nums, target, 0)
end
