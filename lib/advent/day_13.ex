defmodule Advent.Day13 do
  def default_input do
    File.read!("data/input_day_13")
  end

  def optimal_happiness(input) do
    input
    |> parse
    |> do_optimal_happiness
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
    |> Enum.into(%{})
  end

  defp parse_line(line) when is_binary(line) do
    line
    |> String.strip(?.)
    |> String.split(" ")
    |> parse_line
  end
  defp parse_line([person_1, _, "gain", amount, _, _, _, _, _, _, person_2]) do
    amount = String.to_integer(amount)
    {{person_1, person_2}, amount}
  end
  defp parse_line([person_1, _, "lose", amount, _, _, _, _, _, _, person_2]) do
    amount = String.to_integer(amount)
    {{person_1, person_2}, amount * -1}
  end

  defp do_optimal_happiness(data) do
    data
    |> extract_people
    |> permutations
    |> Enum.reduce(0, fn
      permutation, best ->
        [calc_happiness(data, permutation), best] |> Enum.max
    end)
  end

  defp extract_people(data, acc \\ MapSet.new)
  defp extract_people(%{} = data, acc), do: extract_people(Map.keys(data), acc)
  defp extract_people([], acc), do: Enum.into(acc, [])
  defp extract_people([{person, _} | rest], acc), do: extract_people(rest, Set.put(acc, person))

  defp permutations([]), do: [[]]
  defp permutations(list) do
    for h <- list, t <- permutations(list -- [h]), do: [h | t]
  end

  defp calc_happiness(data, [first | _rest] = permutation) do
    calc_happiness(data, permutation, first, 0)
  end
  defp calc_happiness(data, [a, b | rest], first, acc) do
    happiness = data[{a, b}] + data[{b, a}]
    calc_happiness(data, [b | rest], first, acc + happiness)
  end
  defp calc_happiness(data, [a], first, acc) do
    happiness = data[{a, first}] + data[{first, a}]
    acc + happiness
  end
end
