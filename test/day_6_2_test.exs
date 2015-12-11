defmodule Advent.Day6_2Test do
  use ExUnit.Case
  import Advent.Day6_2
  doctest Advent

  test "execute turn on" do
    result = new
            |> execute("turn on 2,2 through 4,6")
            |> count

    assert result == 15
  end

  test "turn on same lights twice" do

    result = new
            |> execute("turn on 2,2 through 4,6")
            |> execute("turn on 2,2 through 4,6")
            |> count

    assert result == 30
  end

  test "execute turn off" do
    result = new
              |> execute("turn on 0,0 through 9,9")
              |> execute("turn off 0,0 through 9,0")
              |> count

    assert result == 90
  end

  test "execute turn off twice" do
    result = new
              |> execute("turn on 0,0 through 9,9")
              |> execute("turn off 0,0 through 9,9")
              |> execute("turn off 0,0 through 9,9")
              |> count

    assert result == 0
  end

  test "execute toggle" do
    result = new
            |> execute("toggle 0,0 through 0,9")
            |> count

    assert result == 20
  end
end
