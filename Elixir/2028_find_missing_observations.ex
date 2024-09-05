defmodule Solution do
  @spec sum(arr :: [integer]) :: integer
  defp sum([]), do: 0
  defp sum([h | t]), do: h + sum(t)
  
  @spec distribute(mean :: integer, remain :: integer, n :: integer) :: [integer]
  defp distribute(_, _, 0), do: []
  defp distribute(mean, remain, n) do
    sub = remain-(mean+1)
    res = cond do
      mean < 6 and sub >= 0 and div(sub, n-1) == mean -> mean+1
      true -> mean
    end
    [res | distribute(mean, remain-res, n-1)]
  end

  @spec missing_rolls(rolls :: [integer], mean :: integer, n :: integer) :: [integer]
  def missing_rolls(rolls, mean, n) do
    remain = (mean * (length(rolls)+n)) - sum(rolls)
    cond do
      remain < n or remain > 6*n -> []
      true -> distribute(div(remain, n), remain, n)
    end
  end
end
