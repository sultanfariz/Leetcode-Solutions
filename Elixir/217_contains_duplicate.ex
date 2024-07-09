defmodule Solution do
  @spec check_duplicate(nums :: [integer]) :: boolean
  defp check_duplicate([]), do: false
  defp check_duplicate([a]), do: false
  defp check_duplicate([a, a | c]), do: true
  defp check_duplicate([a, b | c]), do: check_duplicate([b | c])
  
  @spec contains_duplicate(nums :: [integer]) :: boolean
  def contains_duplicate(nums) do
    nums |> Enum.sort(:asc) |> check_duplicate()
  end
end
