defmodule Solution do
  import Bitwise, only: [bxor: 2]
  @spec decode(encoded :: [integer], first :: integer) :: [integer]
  def decode(encoded, first) do
    encoded 
    |> Enum.with_index
    |> Enum.reduce([first], fn ({el, i}, acc) -> 
      acc = acc ++ [bxor(Enum.at(acc, i), el)]
    end)
  end
end
