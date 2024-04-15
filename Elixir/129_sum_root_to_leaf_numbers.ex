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
  @spec sum_numbers(root :: TreeNode.t | nil, acc :: integer) :: integer
  defp sum_numbers(nil, _), do: 0
  defp sum_numbers(root, acc) when root.left == nil and root.right == nil, do: (acc * 10) + root.val
  defp sum_numbers(root, acc) do
    sum_numbers(root.left, (acc * 10) + root.val) + sum_numbers(root.right, (acc * 10) + root.val)
  end

  @spec sum_numbers(root :: TreeNode.t | nil) :: integer
  def sum_numbers(root), do: sum_numbers(root, 0)
end
