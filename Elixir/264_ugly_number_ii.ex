defmodule Solution do
  @spec min(a :: integer, b :: integer, c :: integer) :: integer
  defp min(a, b, c) when a < b and a < c, do: a
  defp min(a, b, c) when b < a and b < c, do: b
  defp min(a, b, c) when c < a and c < b, do: c
  defp min(a, a, c) when a < c, do: a
  defp min(a, c, a) when a < c, do: a
  defp min(c, a, a) when a < c, do: a
  defp min(a, a, a), do: a

  @spec nth_ugly_number(n :: integer, i2 :: integer, i3 :: integer, i5 :: integer, arr :: [integer]) :: integer
  defp nth_ugly_number(0, _, _, _, arr), do: arr |> List.last
  defp nth_ugly_number(n, i2, i3, i5, arr) do
    el2 = Enum.at(arr, i2) * 2
    el3 = Enum.at(arr, i3) * 3
    el5 = Enum.at(arr, i5) * 5
    last = arr |> List.last
    min = min(el2, el3, el5) 
    cond do
      min == last -> cond do
        min == el2 -> nth_ugly_number(n, i2+1, i3, i5, arr)
        min == el3 -> nth_ugly_number(n, i2, i3+1, i5, arr)
        min == el5 -> nth_ugly_number(n, i2, i3, i5+1, arr)
      end
      min == el2 -> nth_ugly_number(n-1, i2+1, i3, i5, arr ++ [el2])
      min == el3 -> nth_ugly_number(n-1, i2, i3+1, i5, arr ++ [el3])
      min == el5 -> nth_ugly_number(n-1, i2, i3, i5+1, arr ++ [el5])
    end
  end

  @spec nth_ugly_number(n :: integer) :: integer
  def nth_ugly_number(n), do: nth_ugly_number(n-1, 0, 0, 0, [1])
end
