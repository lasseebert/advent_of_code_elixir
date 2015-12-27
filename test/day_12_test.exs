defmodule Advent.Day12Test do
  use ExUnit.Case
  import Advent.Day12

  test "sum" do
    assert sum(~s([1,2,3])) == 6
    assert sum(~s({"a":2,"b":4})) == 6
    assert sum(~s([[[3]]])) == 3
    assert sum(~s({"a":{"b":4},"c":-1})) == 3
    assert sum(~s({"a":[-1,1]})) == 0
    assert sum(~s([-1,{"a":1}])) == 0
    assert sum(~s([])) == 0
    assert sum(~s({})) == 0
  end

  test "sum_no_red" do
    assert sum_no_red(~s([1,2,3])) == 6
    assert sum_no_red(~s([1,{"c":"red","b":2},3])) == 4
    assert sum_no_red(~s({"d":"red","e":[1,2,3,4],"f":5})) == 0
    assert sum_no_red(~s([1,"red",5])) == 6
  end
end
