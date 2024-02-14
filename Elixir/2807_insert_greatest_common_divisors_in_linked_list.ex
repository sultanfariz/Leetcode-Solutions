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
  @spec insert_greatest_common_divisors(head :: ListNode.t | nil) :: ListNode.t | nil
  def insert_greatest_common_divisors(nil), do: nil
  def insert_greatest_common_divisors(head) when head.next == nil, do: head
  def insert_greatest_common_divisors(head) do
    next = %ListNode{val: greatest_common_divisor(head.val, head.next.val), next: insert_greatest_common_divisors(head.next)} 
    %ListNode{val: head.val, next: next} 
  end

  @spec greatest_common_divisor(a :: integer, b :: integer) :: ListNode.t | nil
  def greatest_common_divisor(a, 0), do: a
  def greatest_common_divisor(a, a), do: a
  def greatest_common_divisor(a, b) when b > a, do: greatest_common_divisor(b, a)
  def greatest_common_divisor(a, b) do
    greatest_common_divisor(b, rem(a, b))
  end
end

