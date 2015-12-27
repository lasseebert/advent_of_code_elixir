defmodule Advent.Day14Test do
  use ExUnit.Case
  import Advent.Day14

  def example_input do
    """
      Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
      Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
    """
  end

  test "longest_distance" do
    assert longest_distance(example_input, 1000) == 1120
  end

  test "most_points" do
    assert most_points(example_input, 1000) == 689
  end
end
