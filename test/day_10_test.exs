defmodule Advent.Day10Test do
  use ExUnit.Case
  import Advent.Day10

  test "look_and_say" do
    assert look_and_say("1") == "11"
    assert look_and_say("11") == "21"
    assert look_and_say("21") == "1211"
    assert look_and_say("1211") == "111221"
    assert look_and_say("111221") == "312211"
  end

  test "look_and_say_sequence" do
    assert look_and_say_sequence("1", 5) == "312211"
  end
end

