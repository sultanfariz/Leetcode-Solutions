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
  @spec traverse_node(mid :: ListNode.t | nil, len :: ListNode.t | nil) :: Integer
  def traverse_node(mid, len) when len.next.next === nil, do: mid.next
  def traverse_node(mid, len) when len.next === nil, do: mid
  def traverse_node(mid, len) do
    traverse_node(mid.next, len.next.next)
  end

  @spec middle_node(head :: ListNode.t | nil) :: ListNode.t | nil
  def middle_node(head) do
    traverse_node(head, head)
  end
end
