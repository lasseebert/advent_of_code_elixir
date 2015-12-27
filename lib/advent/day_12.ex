defmodule Advent.Day12 do
  def default_input do
    File.read!("data/input_day_12")
  end

  def sum(input) do
    input
    |> Poison.decode!
    |> do_sum(0)
  end

  def sum_no_red(input) do
    input
    |> Poison.decode!
    |> do_sum_no_red(0)
  end

  def do_sum([], acc), do: acc
  def do_sum([a | rest], acc), do: do_sum(rest, do_sum(a, acc))
  def do_sum(%{} = map, acc), do: do_sum(Map.values(map), acc)
  def do_sum(a, acc) when is_number(a), do: a + acc
  def do_sum(_, acc), do: acc

  def do_sum_no_red([], acc), do: acc
  def do_sum_no_red([a | rest], acc), do: do_sum_no_red(rest, do_sum_no_red(a, acc))
  def do_sum_no_red(%{} = map, acc), do: acc + do_sum_no_red_map_values(Map.values(map), 0)
  def do_sum_no_red(a, acc) when is_number(a), do: a + acc
  def do_sum_no_red(_, acc), do: acc

  def do_sum_no_red_map_values([], acc), do: acc
  def do_sum_no_red_map_values(["red" | _rest], _acc), do: 0
  def do_sum_no_red_map_values([a | rest], acc), do: do_sum_no_red_map_values(rest, do_sum_no_red(a, acc))
end
