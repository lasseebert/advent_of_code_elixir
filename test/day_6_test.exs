defmodule Advent.Day6Test do
  use ExUnit.Case
  alias Advent.Day6
  doctest Advent

  test "execute turn on" do
    grid = Day6.new
            |> Day6.execute("turn on 2,2 through 4,6")

    assert Day6.get(grid, 2, 2) == :on
    assert Day6.get(grid, 4, 6) == :on
    assert Day6.get(grid, 3, 3) == :on
    assert Day6.get(grid, 1, 2) == nil
    assert Day6.get(grid, 5, 3) == nil
  end

  test "execute turn off" do
    grid = Day6.new
            |> Day6.execute("turn on 0,0 through 9,9")
            |> Day6.execute("turn off 0,0 through 9,0")

    assert Day6.get(grid, 0, 0) == nil
    assert Day6.get(grid, 0, 1) == :on
  end

  test "execute toggle" do
    grid = Day6.new
            |> Day6.execute("turn on 0,0 through 9,0")
            |> Day6.execute("toggle 0,0 through 1,1")

    assert Day6.get(grid, 0, 0) == nil
    assert Day6.get(grid, 1, 1) == :on
  end
end

