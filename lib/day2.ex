defmodule Day2 do
  def process_opcode(opcode) do
    codes =
      String.split(opcode, ",")
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()
      |> Enum.map(fn {v, i} -> {i, v} end)
      |> Map.new()

    process(codes, 0)
    |> Enum.sort_by(fn {k, _v} -> k end)
    |> Enum.map(fn {_k, v} -> v end)
    |> Enum.to_list
    |> Enum.join(",")
  end

  defp process(codes, position) do
    opcode = codes[position]
    arg1 = Map.get(codes, codes[position + 1])
    arg2 = Map.get(codes, codes[position + 2])
    output = codes[position + 3]

    case opcode do
      1 ->
        result = arg1 + arg2
        Map.put(codes, output, result)
        |> process(position + 4)
      2 ->
        result = arg1 * arg2
        Map.put(codes, output, result)
        |> process(position + 4)
      99 -> codes
    end
  end
end
