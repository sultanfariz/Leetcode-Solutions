# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

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
  @spec traverse(head :: ListNode.t | nil, root :: TreeNode.t | nil) :: boolean
  defp traverse(nil, _), do: true
  defp traverse(_, nil), do: false
  defp traverse(head, root) when head.val == root.val do
    traverse(head.next, root.left) 
    or traverse(head.next, root.right)
  end
  defp traverse(_, _), do: false

  @spec is_sub_path(head :: ListNode.t | nil, root :: TreeNode.t | nil) :: boolean
  def is_sub_path(_, nil), do: false
  def is_sub_path(head, root) do
    case traverse(head, root) do
      true -> true
      false -> is_sub_path(head, root.left) or is_sub_path(head, root.right)
    end
  end
end
