defmodule Advent.Day9 do
  def default_input do
    File.read!("data/input_day_9")
  end

  def shortest_path(input) do
    input
    |> parse
    |> find_shortest_path
  end

  def longest_path(input) do
    input
    |> parse
    |> find_longest_path
  end

  defp parse(input) do
    input
    |> String.strip
    |> String.split("\n")
    |> Enum.map(fn
      line -> parse_line(line)
    end)
    |> List.flatten
    |> Enum.into(%{})
  end

  defp parse_line(line) do
    [from, _, to, _, distance] = line |> String.split(" ")
    distance = String.to_integer(distance)
    [
      {{from, to}, distance},
      {{to, from}, distance}
    ]
  end

  defp find_shortest_path(distances) do
    find_path(distances, fn
      route, acc -> [route_length(route, distances, 0), acc] |> Enum.min
    end)
  end

  defp find_longest_path(distances) do
    find_path(distances, fn
      route, acc -> [route_length(route, distances, 0), acc || 0] |> Enum.max
    end)
  end

  defp find_path(distances, fun) do
    distances
    |> Enum.map(fn
      {{from, _}, _} -> from
    end)
    |> Enum.uniq
    |> permutations
    |> Enum.reduce(nil, fun)
  end

  defp route_length([a, b | rest], distances, acc) do
    route_length([b | rest], distances, acc + distances[{a, b}])
  end
  defp route_length(_, _, acc), do: acc

  defp permutations([]), do: [[]]
  defp permutations(list) do
    for h <- list, t <- permutations(list -- [h]), do: [h | t]
  end
end
