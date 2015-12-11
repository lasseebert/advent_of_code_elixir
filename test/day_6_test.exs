defmodule Advent.Day6Test do
  use ExUnit.Case
  alias Advent.Day6
  doctest Advent

  test "execute turn on" do
    result = Day6.new
            |> Day6.execute("turn on 2,2 through 4,6")
            |> Day6.count

    assert result == 15
  end

  test "execute turn off" do
    result = Day6.new
              |> Day6.execute("turn on 0,0 through 9,9")
              |> Day6.execute("turn off 0,0 through 9,0")
              |> Day6.count

    assert result == 90
  end

  test "execute toggle" do
    result = Day6.new
            |> Day6.execute("turn on 0,0 through 9,0")
            |> Day6.execute("toggle 0,0 through 0,9")
            |> Day6.count

    assert result == 18
  end
end

