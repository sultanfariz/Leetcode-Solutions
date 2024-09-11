defmodule Solution do
  @spec iter(start :: [integer], goal :: [integer]) :: integer
  defp iter([], []), do: 0
  defp iter([1 | b], []), do: 1 + iter(b, [])
  defp iter([0 | b], []), do: iter(b, [])
  defp iter([a | b], [c | d]) when a != c, do: 1 + iter(b, d)
  defp iter([a | b], [c | d]), do: iter(b, d)

  @spec min_bit_flips(start :: integer, goal :: integer) :: integer
  def min_bit_flips(start, goal) when goal > start do
    min_bit_flips(goal, start)
  end
  def min_bit_flips(start, goal) do
    iter(
      Enum.reverse(Integer.digits(start, 2)), 
      Enum.reverse(Integer.digits(goal, 2))
    )
  end
end
