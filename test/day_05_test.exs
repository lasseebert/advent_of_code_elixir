defmodule Advent.Day05_1Test do
  use ExUnit.Case
  alias Advent.Day05_1
  doctest Advent

  test "nice?" do
    assert Day05_1.nice?("ugknbfddgicrmopn")
    assert Day05_1.nice?("aaa")
    refute Day05_1.nice?("jchzalrnumimnmhp")
    refute Day05_1.nice?("haegwjzuvuyypxyu")
    refute Day05_1.nice?("dvszwmarrgswjxmb")
  end

  test "count_nice" do
    input = "ugknbfddgicrmopn\naaa\njchzalrnumimnmhp\nhaegwjzuvuyypxyu\ndvszwmarrgswjxmb\n"
    assert Day05_1.count_nice(input) == 2
  end
end

defmodule Advent.Day05_2Test do
  use ExUnit.Case
  alias Advent.Day05_2
  doctest Advent

  test "nice?" do
    assert Day05_2.nice?("qjhvhtzxzqqjkmpb")
    assert Day05_2.nice?("xxyxx")
    refute Day05_2.nice?("uurcxstgmygtbstg")
    refute Day05_2.nice?("ieodomkazucvgmuy")
  end
end
