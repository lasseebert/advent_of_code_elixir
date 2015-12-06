defmodule Advent.Day2 do
  def calc_need(input) do
    input
    |> parse
    |> calc(0)
  end

  def input do
    File.read!("data/input_day_2")
  end

  defp parse(input) do
    input
    |> String.strip
    |> String.split("\n")
    |> Enum.map(&String.strip/1)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.split("x")
    |> Enum.map(&String.to_integer/1)
  end

  defp calc([], total), do: total
  defp calc([package | rest], total), do: calc(rest, total + calc_one(package))

  defp calc_one(package) do
    package = Enum.sort(package)
    [a, b, c] = package
    2*a*b + 2*a*c + 2*b*c + a*b
  end
end
