defmodule Solution do
  import Bitwise, only: [bxor: 2]

  @spec rec_find_array([integer]) :: [integer]
  def rec_find_array([a]), do: [a]
  def rec_find_array([a, b]), do: [bxor(a, b)]
  def rec_find_array([a, b | t]) do
    rec_find_array([a, b]) ++ rec_find_array([b | t])
  end

  @spec find_array(pref :: [integer]) :: [integer]
  def find_array([a]), do: [a]
  def find_array([a, b | t]) do
    [a] ++ rec_find_array([a, b | t])
  end
end
