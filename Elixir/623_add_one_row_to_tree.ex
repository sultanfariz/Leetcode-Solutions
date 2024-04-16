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
  @spec add_one_row(root :: TreeNode.t | nil, currentNode :: TreeNode.t | nil, val :: integer, depth :: integer, isLeft :: boolean) :: TreeNode.t | nil
  defp add_one_row(_, nil, val, 0, _), do: %TreeNode{val: val, left: nil, right: nil}
  defp add_one_row(_, nil, _, _, _), do: nil
  defp add_one_row(_, currentNode, val, 0, false), do: %TreeNode{val: val, left: nil, right: currentNode}
  defp add_one_row(_, currentNode, val, 0, true), do: %TreeNode{val: val, left: currentNode, right: nil}
  defp add_one_row(root, currentNode, val, depth, _) do
    left = add_one_row(root, currentNode.left, val, depth-1, true)
    right = add_one_row(root, currentNode.right, val, depth-1, false)
    %TreeNode{val: currentNode.val, left: left, right: right}
  end

  @spec add_one_row(root :: TreeNode.t | nil, val :: integer, depth :: integer) :: TreeNode.t | nil
  def add_one_row(root, val, depth) do
    add_one_row(root, root, val, depth-1, true)
  end
end
