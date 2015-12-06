defmodule Advent.Day1 do
  def run(input) do
    input
    |> String.to_char_list
    |> process(0)
  end

  def exercise_input do
    File.read!("data/input_day_1")
  end

  defp process([], floor), do: floor
  defp process([?( | rest], floor), do: process(rest, floor + 1)
  defp process([?) | rest], floor), do: process(rest, floor - 1)
  defp process([_ | rest], floor), do: process(rest, floor)
end
