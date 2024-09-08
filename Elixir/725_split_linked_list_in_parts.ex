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
  @spec traverse(head :: ListNode.t | nil, cap :: integer) :: {ListNode.t | nil, ListNode.t | nil}
  defp traverse(nil, _), do: {nil, nil}
  defp traverse(head, 1) do
    curr = %ListNode{val: head.val, next: nil}
    last = if head.next == nil do
      nil
    else 
      %ListNode{val: head.next.val, next: head.next.next}
    end
    
    {curr, last}
  end
  defp traverse(head, cap) do
    {next, last} = traverse(head.next, cap-1)
    curr = %ListNode{val: head.val, next: next}
    {curr, last}
  end

  @spec split_list_to_parts(head :: ListNode.t | nil, k :: integer, cap :: integer, rem :: integer) :: [ListNode.t | nil]
  defp split_list_to_parts(head, 0, cap, rem), do: []
  defp split_list_to_parts(head, k, cap, rem) do
    count = if rem > 0 do
      cap+1
    else
      cap
    end
    {curr, next} = traverse(head, count)
    [curr | split_list_to_parts(next, k-1, cap, rem-1)]
  end

  @spec len(head :: ListNode.t | nil) :: integer
  defp len(nil), do: 0
  defp len(head), do: 1 + len(head.next)

  @spec split_list_to_parts(head :: ListNode.t | nil, k :: integer) :: [ListNode.t | nil]
  def split_list_to_parts(head, k) do
    n = len(head)
    rem = rem(n, k)
    cap = div(n, k)
    IO.inspect {rem, cap}
    split_list_to_parts(head, k, cap, rem)
  end
end
