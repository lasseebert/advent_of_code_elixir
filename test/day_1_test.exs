defmodule Advent.Day1Test do
  use ExUnit.Case
  alias Advent.Day1
  doctest Advent

  test "simple examples" do
    assert Day1.run("(())") == 0
    assert Day1.run("()()") == 0
    assert Day1.run("(((") == 3
  end
end

