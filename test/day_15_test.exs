defmodule Advent.Day15Test do
  use ExUnit.Case
  import Advent.Day15

  @example_input """
    Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
    Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
  """

  test "best_cookie_score example" do
    assert best_cookie_score(@example_input) == 62842880
  end
end

