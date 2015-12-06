defmodule Advent.Day2Test do
  use ExUnit.Case
  alias Advent.Day2
  doctest Advent

  test "wrapping_need" do
    assert Day2.wrapping_need("0x0x0") == 0
    assert Day2.wrapping_need("2x3x4") == 58
    assert Day2.wrapping_need("1x1x10") == 43
    assert Day2.wrapping_need("2x3x4\n1x1x10\n") == 101
  end

  test "ribbon_need" do
    assert Day2.ribbon_need("0x0x0") == 0
    assert Day2.ribbon_need("2x3x4") == 34
    assert Day2.ribbon_need("1x1x10") == 14
    assert Day2.ribbon_need("2x3x4\n1x1x10\n") == 48
  end
end
