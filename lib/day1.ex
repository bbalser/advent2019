defmodule Day1 do
  def calculate_fuel(mass) do
    div(mass, 3) - 2
  end

  def calculate_total_fuel(mass) do
    Stream.iterate(mass, &calculate_fuel/1)
    |> Stream.drop(1)
    |> Enum.take_while(&(&1 > 0))
    |> Enum.sum()
  end
end
