defmodule Advent.Day6 do
  def new do
    HashDict.new
  end

  def run do
    File.read!("data/input_day_6")
    |> String.strip
    |> String.split("\n")
    |> Enum.reduce(new, fn
      command, grid -> execute(grid, command)
    end)
    |> count
  end

  def execute(grid, "turn on " <> rest) do
    do_execute(grid, rest, fn(_) -> :on end)
  end
  def execute(grid, "turn off " <> rest) do
    do_execute(grid, rest, fn(_) -> nil end)
  end
  def execute(grid, "toggle " <> rest) do
    do_execute(grid, rest, fn
      :on -> nil
      nil -> :on
    end)
  end

  def get(grid, {_, _} = point) do
    Dict.get(grid, point)
  end

  def set(grid, {_, _} = point, nil) do
    Dict.delete(grid, point)
  end
  def set(grid, {_, _} = point, :on = value) do
    Dict.put(grid, point, value)
  end

  def count(grid) do
    Enum.count(grid)
  end

  defp do_execute(grid, coords, fun) do
    [[x1, y1], [x2, y2]] = parse_coords(coords)

    for x <- x1..x2, y <- y1..y2 do
      {x, y}
    end
    |> Enum.reduce(grid, fn
      point, grid ->
        value = get(grid, point)
        new_value = fun.(value)
        set(grid, point, new_value)
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
