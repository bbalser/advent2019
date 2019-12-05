defmodule Day2Test do
  use ExUnit.Case
  import Checkov

  data_test "test opcode processing" do
    assert Day2.process_opcode(opcode) == result

    where(
      opcode: ["1,9,10,3,2,3,11,0,99,30,40,50", "1,1,1,4,99,5,6,0,99", "2,4,4,5,99,0"],
      result: ["3500,9,10,70,2,3,11,0,99,30,40,50", "30,1,1,4,2,5,6,0,99", "2,4,4,5,99,9801"]
    )
  end
end
