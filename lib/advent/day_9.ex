defmodule Advent.Day9 do
  def default_input do
    File.read!("data/input_day_9")
  end

  def shortest_path(input) do
    input
    |> parse
    |> find_shortest_path
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
    distances
    |> Enum.map(fn
      {{from, _}, _} -> from
    end)
    |> Enum.uniq
    |> permutations
    |> Enum.reduce(nil, fn
      route, acc -> [route_length(route, distances), acc] |> Enum.min
    end)
  end

  defp route_length(route, distances, acc \\ 0)
  defp route_length([], _, acc), do: acc
  defp route_length([_], _, acc), do: acc
  defp route_length([a, b | rest], distances, acc) do
    route_length([b | rest], distances, acc + distances[{a, b}])
  end

  defp permutations([]), do: [[]]
  defp permutations(list) do
    for h <- list, t <- permutations(list -- [h]), do: [h | t]
  end
end
