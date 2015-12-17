defmodule Advent.Day9Test do
  use ExUnit.Case
  import Advent.Day9

  test "example" do
    input = "London to Dublin = 464\nLondon to Belfast = 518\nDublin to Belfast = 141\n"

    assert shortest_path(input) == 605
  end

  test "simple" do
    input = "A to B = 1"

    assert shortest_path(input) == 1
  end
end
