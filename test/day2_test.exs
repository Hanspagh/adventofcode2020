defmodule Day2Test do
  use ExUnit.Case


  @data """
  1-3 a: abcde
  1-3 b: cdefg
  2-9 c: ccccccccc
  """

  test "part1" do
    assert Day2.part1(@data) == 2
  end

  test "part2" do
    assert Day2.part2(@data) == 1
  end
end
