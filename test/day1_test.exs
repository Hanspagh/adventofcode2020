defmodule Day1Test do
  use ExUnit.Case


  @data [
    1721,
979,
366,
299,
675,
1456,
  ]

  test "part1" do
    assert Day1.part1(@data) == 514579
  end

  test "part2" do
    assert Day1.part2(@data) == 241861950
  end
end
