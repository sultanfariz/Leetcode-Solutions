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
  @spec is_symmetric(a :: TreeNode.t | nil, b :: TreeNode.t | nil) :: boolean
  defp is_symmetric(nil, nil), do: true
  defp is_symmetric(nil, _), do: false
  defp is_symmetric(_, nil), do: false
  defp is_symmetric(a, b) do
    a.val == b.val and is_symmetric(a.left, b.right) and is_symmetric(a.right, b.left)
  end

  @spec is_symmetric(root :: TreeNode.t | nil) :: boolean
  def is_symmetric(root) do
    is_symmetric(root.left, root.right)
  end
end
