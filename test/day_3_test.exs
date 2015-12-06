defmodule Advent.Day3Test do
  use ExUnit.Case
  alias Advent.Day3
  doctest Advent

  test "uniq_houses" do
    assert Day3.uniq_houses("") == 1
    assert Day3.uniq_houses(">") == 2
    assert Day3.uniq_houses("^>v<") == 4
    assert Day3.uniq_houses("^v^v^v^v^v^v^v^v") == 2
  end

  test "robot_houses" do
    assert Day3.robot_houses("") == 1
    assert Day3.robot_houses("^v") == 3
    assert Day3.robot_houses("^>v<") == 3
    assert Day3.robot_houses("^v^v^v^v^v") == 11
  end
end
