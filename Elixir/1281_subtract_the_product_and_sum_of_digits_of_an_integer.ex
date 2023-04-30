defmodule Solution do
  @spec subtract_product_and_sum(n :: integer) :: integer
  def subtract_product_and_sum(n) do
    digits = Integer.digits(n)
    Enum.product(digits) - Enum.sum(digits)
  end
end
