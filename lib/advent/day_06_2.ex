defmodule Advent.Day06_2 do
  def new do
    HashDict.new
  end

  def run do
    File.read!("data/input_day_06")
    |> String.strip
    |> String.split("\n")
    |> Enum.reduce(new, fn
      command, grid -> execute(grid, command)
    end)
    |> count
  end

  def execute(grid, "turn on " <> rest) do
    do_execute(grid, rest, fn
      value -> value + 1
    end)
  end
  def execute(grid, "turn off " <> rest) do
    do_execute(grid, rest, fn
      0 -> 0
      value -> value - 1
    end)
  end
  def execute(grid, "toggle " <> rest) do
    do_execute(grid, rest, fn
      value -> value + 2
    end)
  end

  def count(grid) do
    grid
    |> Dict.values
    |> Enum.reduce(0, fn
      value, acc -> acc + value
    end)
  end

  defp do_execute(grid, coords, fun) do
    [[x1, y1], [x2, y2]] = parse_coords(coords)

    for x <- x1..x2, y <- y1..y2 do
      {x, y}
    end
    |> Enum.reduce(grid, fn
      point, grid -> Dict.update(grid, point, fun.(0), fun)
    end)
  end

  defp parse_coords(coords) do
    [point_1, _, point_2] = String.split(coords, " ")
    [point_1, point_2]
    |> Enum.map(fn coord ->
      String.split(coord, ",")
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
