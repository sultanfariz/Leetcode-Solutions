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
  @spec is_lexicographically_smaller(arr1 :: [integer], arr2 :: [integer]) :: boolean
  defp is_lexicographically_smaller([a | b], [c | d]) when a < c, do: true
  defp is_lexicographically_smaller([a | b], [c | d]) when a > c, do: false
  defp is_lexicographically_smaller([], _), do: true
  defp is_lexicographically_smaller(_, []), do: false
  defp is_lexicographically_smaller([a | b], [a | d]), do: is_lexicographically_smaller(b, d)

  @spec smallest_from_leaf(root :: TreeNode.t | nil, arr :: [integer]) :: [integer], boolean
  defp smallest_from_leaf(nil, arr), do: [arr, true]
  defp smallest_from_leaf(root, arr) do
    [left, isLeftNil]= smallest_from_leaf(root.left, arr ++ [root.val])
    [right, isRightNil]= smallest_from_leaf(root.right, arr ++ [root.val])

    isLeftSmaller = is_lexicographically_smaller(Enum.reverse(left), Enum.reverse(right))

    cond do
      isLeftNil -> [right, false]
      isLeftSmaller || isRightNil -> [left, false]
      true -> [right, false]
    end
  end

  @spec smallest_from_leaf(root :: TreeNode.t | nil) :: String.t
  def smallest_from_leaf(root) do
    [res, _] = smallest_from_leaf(root, [])
    res 
    |> Enum.reverse
    |> Enum.map(fn el -> el + 97 end) 
    |> Enum.map(&List.to_string([&1])) 
    |> Enum.join("")
  end
end
