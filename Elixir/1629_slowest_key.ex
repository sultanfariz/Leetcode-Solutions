defmodule Solution do
  @spec slowest_key(release_times :: [integer], keys_pressed :: [String.t], max_time :: integer, max_key :: String.t) :: String.t
  defp slowest_key([], [], _, max_key), do: String.at(max_key, 0)
  defp slowest_key([_], [_], _, max_key), do: String.at(max_key, 0)
  defp slowest_key([a, b | c], [_, e | f], max_time, max_key) when b-a > max_time do
    slowest_key([b | c], [e | f], b-a, e)
  end
  defp slowest_key([a, b | c], [_, e | f], max_time, max_key) when b-a == max_time do
    e = if e > max_key, do: e, else: max_key
    slowest_key([b | c], [e | f], b-a, e)
  end
  defp slowest_key([a, b | c], [_, e | f], max_time, max_key) do
    slowest_key([b | c], [e | f], max_time, max_key)
  end

  @spec slowest_key(release_times :: [integer], keys_pressed :: String.t) :: char
  def slowest_key(release_times, keys_pressed) do
    keys_pressed = keys_pressed |> String.graphemes
    <<char>> = slowest_key(release_times, keys_pressed, Enum.at(release_times, 0), Enum.at(keys_pressed, 0)) 
    char
  end
end
