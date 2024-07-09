defmodule Solution do
  @spec simulate_queue(customers :: [[integer]], current_time :: integer, total_time :: integer, count :: integer) :: float
  def simulate_queue([], current_time, total_time, count), do: total_time / count
  def simulate_queue([[arrival, time] | t], 0, total_time, count) do
    simulate_queue([[arrival, time] | t], arrival, total_time, count)
  end
  def simulate_queue([[arrival, time] | t], current_time, total_time, count) do
    current_time = cond do
      arrival > current_time -> arrival
      true -> current_time
    end
    waiting_time = current_time + time - arrival
    simulate_queue(t, current_time + time, total_time + waiting_time, count + 1)
  end

  @spec average_waiting_time(customers :: [[integer]]) :: float
  def average_waiting_time(customers) do
    simulate_queue(customers, 0, 0, 0)
  end
end
