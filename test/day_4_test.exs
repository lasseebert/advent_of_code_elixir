defmodule Advent.Day4Test do
  use ExUnit.Case
  alias Advent.Day4
  doctest Advent

  @tag :skip # Slow
  test "mine_advent_coin" do
    assert Day4.mine_advent_coin("abcdef") == 609043
    assert Day4.mine_advent_coin("pqrstuv") == 1048970
  end
end
