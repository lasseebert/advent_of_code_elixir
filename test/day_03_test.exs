defmodule Advent.Day03Test do
  use ExUnit.Case
  alias Advent.Day03
  doctest Advent

  test "uniq_houses" do
    assert Day03.uniq_houses("") == 1
    assert Day03.uniq_houses(">") == 2
    assert Day03.uniq_houses("^>v<") == 4
    assert Day03.uniq_houses("^v^v^v^v^v^v^v^v") == 2
  end

  test "robot_houses" do
    assert Day03.robot_houses("") == 1
    assert Day03.robot_houses("^v") == 3
    assert Day03.robot_houses("^>v<") == 3
    assert Day03.robot_houses("^v^v^v^v^v") == 11
  end
end
