defmodule Advent.Day7Test do
  use ExUnit.Case
  import Advent.Day7

  test "constant" do
    assert run(["1 -> a"]) == %{"a" => 1}
  end

  test "small circuit" do
    input = [
      "123 -> x",
      "456 -> y",
      "x AND y -> d",
      "x OR y -> e",
      "x LSHIFT 2 -> f",
      "y RSHIFT 2 -> g",
      "NOT x -> h",
      "NOT y -> i"
    ]
    expected = %{
      d: 72,
      e: 507,
      f: 492,
      g: 114,
      h: 65412,
      i: 65079,
      x: 123,
      y: 456
    }

    result = run(input)

    assert result == expected
  end
end


