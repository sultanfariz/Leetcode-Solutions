defmodule Solution do
  @spec bubble_sort_people(names :: [String.t], heights :: [integer]) :: {[String.t], [integer]}
  def bubble_sort_people([a], [b]), do: {[a], [b]}
  def bubble_sort_people([a, b | c], [d, e | f]) when d < e do
    {sorted_names, sorted_heights} = bubble_sort_people([a | c], [d | f])
    {[b | sorted_names], [e | sorted_heights]}
  end
  def bubble_sort_people([a, b | c], [d, e | f]) do
    {sorted_names, sorted_heights} = bubble_sort_people([b | c], [e | f])
    {[a | sorted_names], [d | sorted_heights]}
  end

  @spec iter_sort(names :: [String.t], heights :: [integer], n :: integer) :: {[String.t], [integer]}
  def iter_sort(names, heights, 0), do: {names, heights}
  def iter_sort(names, heights, n) do
    {sorted_names, sorted_heights} = bubble_sort_people(names, heights)
    iter_sort(sorted_names, sorted_heights, n-1)
  end

  @spec sort_people(names :: [String.t], heights :: [integer]) :: [String.t]
  def sort_people(names, heights) do
    n = length(names)
    {sorted_names, sorted_heights} = iter_sort(names, heights, n)
    sorted_names
  end
end
