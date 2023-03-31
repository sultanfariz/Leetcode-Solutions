defmodule Solution do
  @spec convert_temperature(celsius :: float) :: [float]
  def convert_temperature(celsius) do
    [celsius + 273.15, (celsius * 1.80) + 32.00]
  end
end
