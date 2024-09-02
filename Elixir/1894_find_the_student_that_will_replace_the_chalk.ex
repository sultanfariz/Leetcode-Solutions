defmodule Solution do
  @spec chalk_sum(chalk :: [integer]) :: integer
  defp chalk_sum([]), do: 0
  defp chalk_sum([h | t]), do: h + chalk_sum(t)

  @spec chalk_replacer(chalk :: [integer], k :: integer, i :: integer) :: integer
  defp chalk_replacer([], _, _), do: 0
  defp chalk_replacer([h | t], k, i) when k < h, do: i
  defp chalk_replacer([h | t], k, i) do
    chalk_replacer(t, k-h, i+1)
  end

  @spec chalk_replacer(chalk :: [integer], k :: integer) :: integer
  def chalk_replacer(chalk, k) do
    n = chalk_sum(chalk)
    k = if n < k, do: rem(k, n), else: k
    chalk_replacer(chalk, k, 0)
  end
end
