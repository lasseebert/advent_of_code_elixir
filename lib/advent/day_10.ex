defmodule Advent.Day10 do
  def default_input do
    "1113222113"
  end

  def look_and_say(input) do
    input
    |> String.to_char_list
    |> do_look_and_say([])
  end

  def look_and_say_sequence(input, 0), do: input
  def look_and_say_sequence(input, count) do
    input
    |> look_and_say
    |> look_and_say_sequence(count - 1)
  end

  defp do_look_and_say([], acc) do
    acc
    |> List.flatten
    |> Enum.join
  end
  defp do_look_and_say([first | rest], acc) do
    {result, rest} = find_next(first, rest, 1)
    do_look_and_say(rest, [acc | [result]])
  end

  defp find_next(char, [char | rest], count) do
    find_next(char, rest, count + 1)
  end
  defp find_next(char, list, count) do
    {"#{count}#{<<char>>}", list}
  end
end
