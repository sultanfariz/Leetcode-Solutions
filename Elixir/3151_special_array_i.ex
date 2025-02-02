defmodule Solution do
  @spec is_array_special(nums :: [integer]) :: boolean
  def is_array_special([_]), do: true
  def is_array_special([a, b | t]) when rem(a, 2) == rem(b, 2), do: false
  def is_array_special([a, b | t]), do: is_array_special([b | t])
end
