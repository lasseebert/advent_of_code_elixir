defmodule Advent.Day09Test do
  use ExUnit.Case
  import Advent.Day09

  test "shortest_path example" do
    input = "London to Dublin = 464\nLondon to Belfast = 518\nDublin to Belfast = 141\n"

    assert shortest_path(input) == 605
  end

  test "shortest_path simple" do
    input = "A to B = 1"

    assert shortest_path(input) == 1
  end

  test "longest_path example" do
    input = "London to Dublin = 464\nLondon to Belfast = 518\nDublin to Belfast = 141\n"

    assert longest_path(input) == 982
  end

  test "longest_path simple" do
    input = "A to B = 1"

    assert longest_path(input) == 1
  end
end
