defmodule Day2Test do
  use ExUnit.Case
  import Checkov

  data_test "test opcode processing" do
    assert Day2.process_opcode(opcode) == result

    where(
      opcode: [
        [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50],
        [1, 1, 1, 4, 99, 5, 6, 0, 99],
        [2, 4, 4, 5, 99, 0]
      ],
      result: [
        [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50],
        [30, 1, 1, 4, 2, 5, 6, 0, 99],
        [2, 4, 4, 5, 99, 9801]
      ]
    )
  end

  test "part two" do
    codes =
      File.read!("source/day2.txt")
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    {noun, verb, _} =
    for noun <- 0..99,
        verb <- 0..99,
        into: [] do
      {noun, verb}
    end
    |> Enum.map(fn {noun, verb} ->
      [result | _] =
        codes
        |> List.replace_at(1, noun)
        |> List.replace_at(2, verb)
        |> Day2.process_opcode()

      {noun, verb, result}
    end)
    |> Enum.filter(fn {_noun, _verb, result} -> result == 19690720 end)
    |> List.first()

    IO.inspect(noun, label: "noun")
    IO.inspect(verb, label: "verb")
    assert 0 == 100 * noun + verb
  end
end
