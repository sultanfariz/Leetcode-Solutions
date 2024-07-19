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
  @spec traverse_leaves(root :: TreeNode.t | nil, distance :: integer) :: { integer, [integer] }
  defp traverse_leaves(nil, _), do: { 0, [] }
  defp traverse_leaves(%TreeNode{left: nil, right: nil}, _), do: { 0, [1] }
  defp traverse_leaves(root, distance) do
    { l_acc, l_dist } = traverse_leaves(root.left, distance)
    { r_acc, r_dist } = traverse_leaves(root.right, distance) 
    l_dist = l_dist |> Enum.sort(:asc)
    r_dist = r_dist |> Enum.sort(:asc)
    distances = l_dist ++ r_dist
    {l_acc + r_acc + check_good_pairs(l_dist, r_dist, distance), distances |> increment_list }
  end

  @spec increment_list(list :: [integer]) :: [integer]
  defp increment_list([]), do: []
  defp increment_list([h | t]), do: [h+1 | increment_list(t)]

  @spec check_good_pairs(left :: [integer], right :: [integer], dist :: integer) :: integer
  defp check_good_pairs([], _, _), do: 0
  defp check_good_pairs([h | t], right, dist), do: check_good_pair(h, right, dist) + check_good_pairs(t, right, dist)

  @spec check_good_pair(left :: integer, right :: [integer], dist :: integer) :: integer
  defp check_good_pair(_, [], _), do: 0
  defp check_good_pair(left, [h | _], dist) when left+h > dist, do: 0
  defp check_good_pair(left, [_ | t], dist), do: 1 + check_good_pair(left, t, dist)

  @spec count_pairs(root :: TreeNode.t | nil, distance :: integer) :: integer
  def count_pairs(root, distance) do
    {res, _} = traverse_leaves(root, distance)
    res
  end
end
