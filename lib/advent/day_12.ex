defmodule Advent.Day12 do
  def default_input do
    File.read!("data/input_day_12")
  end

  def sum(input) do
    input
    |> Poison.decode!
    |> do_sum(0)
  end

  def do_sum([], acc), do: acc
  def do_sum([a | rest], acc), do: do_sum(rest, do_sum(a, acc))
  def do_sum(%{} = map, acc), do: do_sum(Map.values(map), acc)
  def do_sum(a, acc) when is_number(a), do: a + acc
  def do_sum(_, acc), do: acc
end
