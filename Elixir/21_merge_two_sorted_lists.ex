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
  @spec merge_two_lists(list1 :: ListNode.t | nil, list2 :: ListNode.t | nil) :: ListNode.t | nil
  def merge_two_lists(nil, list2), do: list2
  def merge_two_lists(list1, nil), do: list1
  def merge_two_lists(%ListNode{val: val1, next: next1} = list1, %ListNode{val: val2, next: next2} = list2) do
    cond do 
      val1 < val2 -> %ListNode{val: val1, next: merge_two_lists(next1, list2)}
      true -> %ListNode{val: val2, next: merge_two_lists(next2, list1)}
    end
  end
end
