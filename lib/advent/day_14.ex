defmodule Advent.Day14 do
  def default_input do
    File.read!("data/input_day_14")
  end

  def longest_distance(input, seconds) do
    input
    |> parse
    |> Enum.map(&travel(&1, seconds))
    |> Enum.max
  end

  defp parse(input) do
    input
    |> String.strip
    |> String.split("\n")
    |> Enum.map(fn
      line ->
        line
        |> String.strip
        |> parse_line
    end)
  end

  defp parse_line(line) do
    %{
      "speed" => speed,
      "fly_seconds" => fly_seconds,
      "rest_seconds" => rest_seconds
    } = ~r/^.* can fly (?<speed>\d+) km\/s for (?<fly_seconds>\d+) seconds, but then must rest for (?<rest_seconds>\d+) seconds\.$/
        |> Regex.named_captures(line)

    %{
      speed: String.to_integer(speed),
      fly_seconds: String.to_integer(fly_seconds),
      rest_seconds: String.to_integer(rest_seconds)
    }
  end

  defp travel(%{speed: speed, fly_seconds: fly_seconds, rest_seconds: rest_seconds}, seconds) do
    period = fly_seconds + rest_seconds
    periods = div(seconds, period)
    rest = rem(seconds, period)
    speed * (periods * fly_seconds + Enum.min([rest, fly_seconds]))
  end
end
