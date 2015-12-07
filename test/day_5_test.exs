defmodule Advent.Day5Test do
  use ExUnit.Case
  alias Advent.Day5
  doctest Advent

  test "nice?" do
    assert Day5.nice?("ugknbfddgicrmopn")
    assert Day5.nice?("aaa")
    refute Day5.nice?("jchzalrnumimnmhp")
    refute Day5.nice?("haegwjzuvuyypxyu")
    refute Day5.nice?("dvszwmarrgswjxmb")
  end

  test "count_nice" do
    input = "ugknbfddgicrmopn\naaa\njchzalrnumimnmhp\nhaegwjzuvuyypxyu\ndvszwmarrgswjxmb\n"
    assert Day5.count_nice(input) == 2
  end
end
