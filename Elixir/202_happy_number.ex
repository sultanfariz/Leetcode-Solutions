defmodule Solution do
  @spec digits_square(n :: integer) :: boolean
  defp digits_square(0), do: 0
  defp digits_square(n) do
    remain = n |> rem(10)
    (remain * remain) + digits_square(div(n, 10))
  end

  @spec is_happy(n :: integer) :: boolean
  def is_happy(1), do: true
  def is_happy(7), do: true
  def is_happy(n) when n < 10, do: false
  def is_happy(n), do: n |> digits_square |> is_happy
end
