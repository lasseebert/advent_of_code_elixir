defmodule Advent.Day2 do
  def wrapping_need(input) do
    input
    |> parse
    |> calc_wrapping_need(0)
  end

  def ribbon_need(input) do
    input
    |> parse
    |> calc_ribbon_need(0)
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

  defp calc_wrapping_need([], total), do: total
  defp calc_wrapping_need([package | rest], total), do: calc_wrapping_need(rest, total + calc_one_wrapping(package))

  defp calc_one_wrapping(package) do
    package = Enum.sort(package)
    [a, b, c] = package
    2*a*b + 2*a*c + 2*b*c + a*b
  end

  defp calc_ribbon_need([], total), do: total
  defp calc_ribbon_need([package | rest], total), do: calc_ribbon_need(rest, total + calc_one_ribbon(package))

  defp calc_one_ribbon(package) do
    package = Enum.sort(package)
    [a, b, c] = package
    2*a + 2*b + a*b*c
  end
end
