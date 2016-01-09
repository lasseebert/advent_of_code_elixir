defmodule Advent.Day01 do
  def find_floor(input) do
    input
    |> String.to_char_list
    |> find_floor(0)
  end

  def basement_position(input) do
    input
    |> String.to_char_list
    |> basement_position(1, 0)
  end

  def exercise_input do
    File.read!("data/input_day_01")
  end

  defp find_floor([], floor), do: floor
  defp find_floor([?( | rest], floor), do: find_floor(rest, floor + 1)
  defp find_floor([?) | rest], floor), do: find_floor(rest, floor - 1)
  defp find_floor([_ | rest], floor), do: find_floor(rest, floor)

  defp basement_position([?) | _rest], position, 0), do: position
  defp basement_position([?( | rest], position, floor), do: basement_position(rest, position + 1, floor + 1)
  defp basement_position([?) | rest], position, floor), do: basement_position(rest, position + 1, floor - 1)
  defp basement_position([], _, _), do: nil

end
