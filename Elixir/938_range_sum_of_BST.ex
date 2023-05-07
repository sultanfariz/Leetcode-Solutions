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
  @spec range_sum_bst(root :: TreeNode.t | nil, low :: integer, high :: integer) :: integer
  def range_sum_bst(nil, _, _), do: 0
  def range_sum_bst(root, low, high) do
    sum = if root.val >= low and root.val <= high, do: root.val, else: 0
    sum + range_sum_bst(root.left, low, high) + range_sum_bst(root.right, low, high)
  end
end
