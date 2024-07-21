defmodule Solution do
  @spec largest_altitude(gain :: [integer], last :: integer) :: integer
  defp largest_altitude([h], last), do: max_int(last, h + last)
  defp largest_altitude([h | t], last), do: max_int(last, largest_altitude(t, h + last))

  @spec max_int(a :: integer, b :: integer) :: integer
  defp max_int(a, b) when a > b, do: a
  defp max_int(_, b), do: b

  @spec largest_altitude(gain :: [integer]) :: integer
  def largest_altitude(gain), do: largest_altitude(gain, 0)
end
