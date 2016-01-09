defmodule Advent.Day04Test do
  use ExUnit.Case
  alias Advent.Day04
  doctest Advent

  @tag :skip # Slow
  test "mine_advent_coin" do
    assert Day04.mine_advent_coin("abcdef") == 609043
    assert Day04.mine_advent_coin("pqrstuv") == 1048970
  end
end
