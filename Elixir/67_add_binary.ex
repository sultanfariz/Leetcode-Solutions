defmodule Solution do
  @spec add_binary(first :: [String.t], second :: [String.t], carry :: integer) :: [String.t]
  def add_binary([], [], 0), do: []
  def add_binary([], [], 1), do: ["1"]
  def add_binary([a | b], [], carry) do
    a = a |> String.to_integer
    case a + carry do 
      2 -> ["0" | add_binary(b, [], 1)]
      1 -> ["1" | add_binary(b, [], 0)]
      _ -> ["0" | add_binary(b, [], 0)]
    end
  end
  def add_binary([], [c | d], carry) do
    c = c |> String.to_integer
    case c + carry do 
      2 -> ["0" | add_binary([], d, 1)]
      1 -> ["1" | add_binary([], d, 0)]
      _ -> ["0" | add_binary([], d, 0)]
    end
  end
  def add_binary([a | b], [c | d], carry) do
    a = a |> String.to_integer
    c = c |> String.to_integer
    res = a + c + carry
    case res do 
      3 -> ["1" | add_binary(b, d, 1)]
      2 -> ["0" | add_binary(b, d, 1)]
      1 -> ["1" | add_binary(b, d, 0)]
      _ -> ["0" | add_binary(b, d, 0)]
    end
  end

  @spec add_binary(a :: String.t, b :: String.t) :: String.t
  def add_binary(a, b) do
    a = a |> String.graphemes |> Enum.reverse
    b = b |> String.graphemes |> Enum.reverse
    add_binary(a, b, 0) |> Enum.reverse |> Enum.join
  end
end
