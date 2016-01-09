defmodule Advent.Day03 do
  def input do
    File.read!("data/input_day_03")
  end

  def uniq_houses(input) do
    input
    |> parse
    |> do_uniq_houses
  end

  def robot_houses(input) do
    input
    |> parse
    |> do_robot_houses
  end

  defp do_uniq_houses(data), do: do_uniq_houses(data, {0, 0}, %{{0, 0} => 1})

  defp do_uniq_houses([dir | rest], pos, map) do
    pos = move(pos, dir)
    map = add_pos(map, pos)
    do_uniq_houses(rest, pos, map)
  end
  defp do_uniq_houses([], _, map) do
    Enum.count(map)
  end

  defp do_robot_houses(data), do: do_robot_houses(data, {0, 0}, {0, 0}, %{{0,0} => 1})
  defp do_robot_houses([dir | rest], pos1, pos2, map) do
    pos1 = move(pos1, dir)
    map = add_pos(map, pos1)
    do_robot_houses(rest, pos2, pos1, map)
  end
  defp do_robot_houses([], _, _, map) do
    Enum.count(map)
  end



  defp move({x, y}, :north), do: {x, y+1}
  defp move({x, y}, :south), do: {x, y-1}
  defp move({x, y}, :east),  do: {x+1, y}
  defp move({x, y}, :west),  do: {x-1, y}

  defp add_pos(map, pos) do
    Map.put(map, pos, 1)
  end

  defp parse(input) do
    input
    |> String.strip
    |> String.to_char_list
    |> Enum.map(&char_to_dir/1)
  end

  defp char_to_dir(?^), do: :north
  defp char_to_dir(?v), do: :south
  defp char_to_dir(?>), do: :east
  defp char_to_dir(?<), do: :west
end

