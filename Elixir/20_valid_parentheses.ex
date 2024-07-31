defmodule Solution do
  @spec is_valid(s :: [String.t], stack :: [String.t]) :: boolean
  def is_valid([], []), do: true
  def is_valid([], stack), do: false
  def is_valid([")" | t], ["(" | a]), do: is_valid(t, a)
  def is_valid(["]" | t], ["[" | a]), do: is_valid(t, a)
  def is_valid(["}" | t], ["{" | a]), do: is_valid(t, a)
  def is_valid([h | t], stack), do: is_valid(t, [h | stack])

  @spec is_valid(s :: String.t) :: boolean
  def is_valid(s) do
    is_valid(String.graphemes(s), [])
  end
end
