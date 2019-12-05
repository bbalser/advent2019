defmodule Day1Test do
  use ExUnit.Case
  import Checkov

  data_test "can calculate fuel from mass" do
    assert Day1.calculate_fuel(mass) == fuel

    where(
      mass: [1969, 100_756],
      fuel: [654, 33583]
    )
  end

  data_test "can calculate fuel better" do
    assert Day1.calculate_total_fuel(mass) == fuel

    where(
      mass: [1969, 100_756],
      fuel: [966, 50346]
    )
  end
end
