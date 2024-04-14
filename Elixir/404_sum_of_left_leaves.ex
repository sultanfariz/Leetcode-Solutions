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
  @spec sum_of_left_leaves(root :: TreeNode.t | nil) :: integer
  def sum_of_left_leaves(nil), do: 0
  def sum_of_left_leaves(root) when root.left.left == nil and root.left.right == nil do
    root.left.val + sum_of_left_leaves(root.right)
  end
  def sum_of_left_leaves(root) do
    sum_of_left_leaves(root.left) + sum_of_left_leaves(root.right)
  end
end
