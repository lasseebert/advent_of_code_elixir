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

  test "Overhead 2: No escaping" do
    assert overhead_2(~S("")) == 4
  end

  test "Overhead 2: Double backslash" do
    assert overhead_2(~S("abc\\abc")) == 6
  end

  test "Overhead 2: Escaped quote" do
    assert overhead_2(~S("abc\"abc")) == 6
  end

  test "Overhead 2: Escaped ascii" do
    assert overhead_2(~S("abc\xe0abc")) == 5
  end

  test "Overheads 2: Sample input" do
    input = [
      ~S(""),
      ~S("abc"),
      ~S("aaa\"aaa"),
      ~S("\x27")
    ]

    assert overheads_2(input) == 19
  end
end
