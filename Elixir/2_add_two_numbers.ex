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
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil, carry :: integer) :: ListNode.t | nil
  defp add_two_numbers(nil, nil, 0), do: nil
  defp add_two_numbers(nil, nil, carry), do: %ListNode{val: carry, next: nil}
  defp add_two_numbers(nil, l2, carry) do
    res = l2.val + carry
    %ListNode{val: rem(res, 10), next: add_two_numbers(nil, l2.next, div(res, 10))}
  end
  defp add_two_numbers(l1, nil, carry) do
    res = l1.val + carry
    %ListNode{val: rem(res, 10), next: add_two_numbers(nil, l1.next, div(res, 10))}
  end
  defp add_two_numbers(l1, l2, carry) do
    res = l1.val + l2.val + carry
    %ListNode{val: rem(res, 10), next: add_two_numbers(l1.next, l2.next, div(res, 10))}
  end

  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  def add_two_numbers(l1, l2), do: add_two_numbers(l1, l2, 0)
end
