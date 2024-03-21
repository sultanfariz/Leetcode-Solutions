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
  @spec traverse_list(head :: ListNode.t | nil, currHead :: ListNode.t | nil) :: ListNode.t | nil
  def traverse_list(nil, currHead), do: currHead
  def traverse_list(head, currHead) do
    currHead = %ListNode{val: head.val, next: currHead}
    traverse_list(head.next, currHead)
  end

  @spec reverse_list(head :: ListNode.t | nil) :: ListNode.t | nil
  def reverse_list(head) do
    traverse_list(head, nil) 
  end
end
