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
  @spec is_same_tree(p :: TreeNode.t | nil, q :: TreeNode.t | nil) :: boolean
  def is_same_tree(p, q) when p.val !== q.val, do: false
  def is_same_tree(nil, nil), do: true
  def is_same_tree(nil, _), do: false
  def is_same_tree(_, nil), do: false
  def is_same_tree(p, q) do
    is_same_tree(p.left, q.left) and is_same_tree(p.right, q.right)
  end
end
