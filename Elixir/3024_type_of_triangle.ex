defmodule Solution do
  @spec triangle_type(nums :: [integer]) :: String.t
  def triangle_type([n, n, n]), do: "equilateral"
  def triangle_type([a, b, c]) 
  when a >= b+c 
    or b >= a+c 
    or c >= a+b, do: "none"
  def triangle_type([n, n, _]), do: "isosceles"
  def triangle_type([n, _, n]), do: "isosceles"
  def triangle_type([_, n, n]), do: "isosceles"
  def triangle_type(nums), do: "scalene"
end
