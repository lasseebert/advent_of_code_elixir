defmodule Advent.Day1Test do
  use ExUnit.Case
  alias Advent.Day1
  doctest Advent

  test "find_floor" do
    assert Day1.find_floor("(())") == 0
    assert Day1.find_floor("()()") == 0
    assert Day1.find_floor("(((") == 3
  end

  test "basement_position" do
    assert Day1.basement_position(")") == 1
    assert Day1.basement_position("(()))") == 5
    assert Day1.basement_position("(())") == nil
  end
end

