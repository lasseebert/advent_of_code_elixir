defmodule Advent.Day11Test do
  use ExUnit.Case
  import Advent.Day11

  test "next_password" do
    assert next_password("abcdefgh") == "abcdffaa"
    assert next_password("ghijklmn") == "ghjaabcc"
  end
end


