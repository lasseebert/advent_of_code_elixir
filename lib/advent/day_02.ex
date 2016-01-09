defmodule Advent.Day02 do
  def wrapping_need(input), do: need(input, &calc_wrapping/1)
  def ribbon_need(input), do: need(input, &calc_ribbon/1)

  defp need(input, fun) do
    input
    |> parse
    |> Enum.reduce(0, &(fun.(&1) + &2))
  end

  def input do
    File.read!("data/input_day_02")
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

  defp calc_wrapping(package) do
    package = Enum.sort(package)
    [a, b, c] = package
    3*a*b + 2*a*c + 2*b*c
  end

  defp calc_ribbon(package) do
    package = Enum.sort(package)
    [a, b, c] = package
    2*a + 2*b + a*b*c
  end
end
