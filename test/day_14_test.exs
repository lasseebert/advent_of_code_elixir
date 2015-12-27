defmodule Advent.Day14Test do
  use ExUnit.Case
  import Advent.Day14

  test "longest_distance" do
    input = """
      Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
      Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
    """

    assert longest_distance(input, 1000) == 1120
  end
end


