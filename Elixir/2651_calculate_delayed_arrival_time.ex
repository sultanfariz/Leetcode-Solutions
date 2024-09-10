defmodule Solution do
  @spec find_delayed_arrival_time(arrival_time :: integer, delayed_time :: integer) :: integer
  def find_delayed_arrival_time(arrival_time, delayed_time) do
    arrival_time + delayed_time |> rem(24)
  end
end
