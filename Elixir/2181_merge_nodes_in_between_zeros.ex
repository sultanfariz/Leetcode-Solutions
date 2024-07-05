# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec merge_nodes(head :: ListNode.t | nil, res :: ListNode.t) :: ListNode.t | nil
  defp merge_nodes(nil, _), do: nil
  defp merge_nodes(head, 0) when head.val == 0, do: merge_nodes(head.next, 0)
  defp merge_nodes(head, res) when head.val == 0, do: %ListNode{val: res, next: merge_nodes(head.next, 0)}
  defp merge_nodes(head, res), do: merge_nodes(head.next, res + head.val)

  @spec merge_nodes(head :: ListNode.t | nil) :: ListNode.t | nil
  def merge_nodes(head), do: merge_nodes(head, 0)
end
