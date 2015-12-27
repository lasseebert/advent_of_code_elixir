defmodule Advent.Day14 do
  defmodule Reindeer do
    defstruct(
      speed: 0,
      fly_seconds: 1,
      rest_seconds: 1,
      score: 0,
      distance: 0,
      time: 0
    )

    def travel(%Reindeer{time: time, distance: distance, speed: speed, fly_seconds: fly_seconds, rest_seconds: rest_seconds} = reindeer) do
      new_distance = if time < fly_seconds, do: distance + speed, else: distance
      new_time = if time + 1 < fly_seconds + rest_seconds, do: time + 1, else: 0

      %{reindeer | distance: new_distance, time: new_time}
    end
  end

  def default_input do
    File.read!("data/input_day_14")
  end

  def longest_distance(input, seconds) do
    input
    |> parse
    |> Enum.map(&travel(&1, seconds))
    |> Enum.max
  end

  def most_points(input, seconds) do
    input
    |> parse
    |> travel_all_and_collect_score(seconds)
    |> Enum.map(fn reindeer -> reindeer.score end)
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

    %Reindeer{
      speed: String.to_integer(speed),
      fly_seconds: String.to_integer(fly_seconds),
      rest_seconds: String.to_integer(rest_seconds)
    }
  end

  defp travel(%Reindeer{speed: speed, fly_seconds: fly_seconds, rest_seconds: rest_seconds}, seconds) do
    period = fly_seconds + rest_seconds
    periods = div(seconds, period)
    rest = rem(seconds, period)
    speed * (periods * fly_seconds + Enum.min([rest, fly_seconds]))
  end

  defp travel_all_and_collect_score(reindeers, 0), do: reindeers
  defp travel_all_and_collect_score(reindeers, seconds) do
    reindeers = Enum.map(reindeers, &Reindeer.travel/1)
    best_distance = reindeers
                    |> Enum.map(fn reindeer -> reindeer.distance end)
                    |> Enum.max
    reindeers = Enum.map(reindeers, fn
      %Reindeer{distance: ^best_distance, score: score} = reindeer ->
        %{reindeer | score: score + 1}
      reindeer ->
        reindeer
    end)
    travel_all_and_collect_score(reindeers, seconds - 1)
  end
end
