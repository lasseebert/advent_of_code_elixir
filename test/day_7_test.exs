defmodule Advent.Day7Test do
  use ExUnit.Case
  import Advent.Day7

  test "constant" do
    assert run(["1 -> a"]) == %{"a" => 1}
  end

  test "AND gate" do
    input = [
      "10 -> a",
      "3 -> b",
      "a AND b -> c"
    ]
    expected = %{"a" => 10, "b" => 3, "c" => 2}

    assert run(input) == expected
  end

  test "AND gate defined before constants" do
    input = [
      "a AND b -> c",
      "10 -> a",
      "3 -> b"
    ]
    expected = %{"a" => 10, "b" => 3, "c" => 2}

    assert run(input) == expected
  end

  test "OR gate" do
    input = [
      "10 -> a",
      "3 -> b",
      "a OR b -> c"
    ]
    expected = %{"a" => 10, "b" => 3, "c" => 11}

    assert run(input) == expected
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

