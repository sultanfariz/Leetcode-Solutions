# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end

defmodule Solution do
  @spec findNode(root :: TreeNode.t | nil, val :: integer) :: [String.t] | nil
  defp findNode(nil, _), do: nil
  defp findNode(root, val) when root.val == val, do: [""]
  defp findNode(root, val) do
    case findNode(root.left, val) do
      nil -> 
        case findNode(root.right, val) do
          nil -> nil
          right -> ["R" | right]
        end
      left -> ["L" | left]
    end
  end

  @spec compare_direction(first :: [String.t], second :: [String.t]) :: {String.t, String.t}
  defp compare_direction(first, []), do: {Enum.join(first, ""), ""}
  defp compare_direction([], second), do: {"", Enum.join(second, "")}
  defp compare_direction([a | b], [a | d]), do: compare_direction(b, d)
  defp compare_direction([a | b], [c | d]), do: {Enum.join([a | b], ""), Enum.join([c | d], "")}
  
  @spec turn_upward(str :: String.t) :: String.t
  defp turn_upward(str) do
    str |> String.replace(["L", "R"], "U")
  end

  @spec get_directions(root :: TreeNode.t | nil, start_value :: integer, dest_value :: integer) :: String.t
  def get_directions(root, start_value, dest_value) do
    start = findNode(root, start_value)
    dest = findNode(root, dest_value)
    # IO.inspect start
    # IO.inspect dest
    {start, dest} = compare_direction(start, dest)
    turn_upward(start) <> dest
  end
end
