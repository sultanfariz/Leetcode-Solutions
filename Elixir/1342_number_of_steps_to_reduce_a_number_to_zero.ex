defmodule Solution do
  @spec number_of_steps(num :: integer) :: integer
  def number_of_steps(num) do
    number_of_steps(num, 0)
  end

  @spec number_of_steps(num :: integer, acc :: integer) :: integer
  defp number_of_steps(0, acc), do: acc
  defp number_of_steps(num, acc) when rem(num,2)!=0, do: number_of_steps(num-1, acc+1)
  defp number_of_steps(num, acc), do: number_of_steps(div(num,2), acc+1)
end
