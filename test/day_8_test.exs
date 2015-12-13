defmodule Advent.Day8Test do
  use ExUnit.Case
  import Advent.Day8

  test "Overhead: No escaping" do
    assert overhead(~S("abc")) == 2
  end

  test "Overhead: Double backslash" do
    assert overhead(~S("abc\\abc")) == 3
  end

  test "Overhead: Escaped quote" do
    assert overhead(~S("abc\"abc")) == 3
  end

  test "Overhead: Escaped ascii" do
    assert overhead(~S("abc\xe0abc")) == 5
  end

  test "Overheads: Sample input" do
    input = [
      ~S(""),
      ~S("abc"),
      ~S("aaa\"aaa"),
      ~S("\x27")
    ]

    assert overheads(input) == 12
  end
end
