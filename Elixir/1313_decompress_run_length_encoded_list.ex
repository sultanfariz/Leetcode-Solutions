defmodule Solution do
  @spec decompress_rl_elist(nums :: [integer]) :: [integer]
  def decompress_rl_elist(nums) do
    nums
    |> group_by_2
    |> Enum.reduce([], fn ([num1, num2], acc) -> 
      acc = acc ++ repeat(num1, num2)
    end)
  end

  @spec repeat(occ :: integer, num :: integer) :: [integer]
  def repeat(1, num), do: [num]
  def repeat(occ, num) do
    [num | repeat(occ-1, num)]
  end

  @spec group_by_2(nums :: [integer]) :: [integer]
  def group_by_2([num1, num2]), do: [[num1, num2]]
  def group_by_2([num1, num2 | rest]) do
    [[num1, num2] | group_by_2(rest)]
  end
end
