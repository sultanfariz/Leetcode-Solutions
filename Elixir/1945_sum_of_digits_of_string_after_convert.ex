defmodule Solution do
  @spec to_int(s :: String.t) :: integer
  defp to_int(<<char>>) do
    char - ?a +1
  end

  @spec str_to_int(s :: [String.t], carry :: integer) :: integer
  defp str_to_int([], carry), do: carry
  defp str_to_int([h | t], carry) do
    char = to_int(h)
    carry = if char > 9, do: carry * 100, else: carry * 10
    str_to_int(t, carry + char)
  end

  @spec transformer(int :: integer) :: integer
  defp transformer(0), do: 0
  defp transformer(int) do
    rem(int, 10) + transformer(div(int, 10))
  end

  @spec iter(int :: integer, k :: integer) :: integer
  defp iter(int, 0), do: int
  defp iter(int, k) do
    int
    |> transformer
    |> iter(k-1)
  end

  @spec get_lucky(s :: String.t, k :: integer) :: integer
  def get_lucky(s, k) do
    s
    |> String.graphemes
    |> str_to_int(0)
    |> iter(k)
  end
end
