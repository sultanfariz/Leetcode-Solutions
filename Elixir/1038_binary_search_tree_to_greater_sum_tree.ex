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
  @spec bst_to_gst(root :: TreeNode.t | nil, acc :: integer) :: {TreeNode.t | nil, integer}
  defp bst_to_gst(root, acc) do
    {right, acc} = if root.right == nil, do: {nil, acc}, else: bst_to_gst(root.right, acc)
    mid = acc + root.val
    {left, acc} = if root.left == nil, do: {nil, mid}, else: bst_to_gst(root.left, mid)
    {%TreeNode{val: mid, right: right, left: left}, acc}
  end

  @spec bst_to_gst(root :: TreeNode.t | nil) :: TreeNode.t | nil
  def bst_to_gst(root) do
    {res, acc} = bst_to_gst(root, 0)
    res
  end
end
