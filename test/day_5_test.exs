defmodule Advent.Day5_1Test do
  use ExUnit.Case
  alias Advent.Day5_1
  doctest Advent

  test "nice?" do
    assert Day5_1.nice?("ugknbfddgicrmopn")
    assert Day5_1.nice?("aaa")
    refute Day5_1.nice?("jchzalrnumimnmhp")
    refute Day5_1.nice?("haegwjzuvuyypxyu")
    refute Day5_1.nice?("dvszwmarrgswjxmb")
  end

  test "count_nice" do
    input = "ugknbfddgicrmopn\naaa\njchzalrnumimnmhp\nhaegwjzuvuyypxyu\ndvszwmarrgswjxmb\n"
    assert Day5_1.count_nice(input) == 2
  end
end

defmodule Advent.Day5_2Test do
  use ExUnit.Case
  alias Advent.Day5_2
  doctest Advent

  test "nice?" do
    assert Day5_2.nice?("qjhvhtzxzqqjkmpb")
    assert Day5_2.nice?("xxyxx")
    refute Day5_2.nice?("uurcxstgmygtbstg")
    refute Day5_2.nice?("ieodomkazucvgmuy")
  end
end
