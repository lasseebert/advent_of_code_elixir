defmodule Advent.Day01Test do
  use ExUnit.Case
  alias Advent.Day01
  doctest Advent

  test "find_floor" do
    assert Day01.find_floor("(())") == 0
    assert Day01.find_floor("()()") == 0
    assert Day01.find_floor("(((") == 3
  end

  test "basement_position" do
    assert Day01.basement_position(")") == 1
    assert Day01.basement_position("(()))") == 5
    assert Day01.basement_position("(())") == nil
  end
end

