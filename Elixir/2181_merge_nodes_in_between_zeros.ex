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
  @spec merge_nodes(head :: ListNode.t | nil) :: ListNode.t | nil
  def merge_nodes(head) when head == nil or head.next == nil, do: nil
  def merge_nodes(%{val: 0, next: next}) do
    %ListNode{val: sum_nodes(next), next: merge_nodes(next)} 
  end
  def merge_nodes(head) do
    merge_nodes(head.next)
  end

  @spec sum_nodes(head :: ListNode.t | nil) :: integer
  def sum_nodes(head) when head == nil or head.val == 0, do: 0
  def sum_nodes(head) do
    head.val + sum_nodes(head.next)
  end
end
