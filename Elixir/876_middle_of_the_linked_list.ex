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
  @spec node_length(head :: ListNode.t | nil, len :: Integer) :: Integer
  def node_length(head, len) when head.next == nil, do: div(len+1,2)
  def node_length(head, len), do: node_length(head.next, len+1)

  @spec traverse_node(head :: ListNode.t | nil, len :: Integer, mid :: Integer) :: Integer
  def traverse_node(head, len, mid) when head.next === nil, do: head
  def traverse_node(head, len, len), do: head
  def traverse_node(head, len, mid) do
    traverse_node(head.next, len+1, mid)
  end

  @spec middle_node(head :: ListNode.t | nil) :: ListNode.t | nil
  def middle_node(head) do
    mid = node_length(head, 0)
    traverse_node(head, 0, mid)
  end
end
