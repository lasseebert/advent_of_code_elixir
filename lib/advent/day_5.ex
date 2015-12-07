defmodule Advent.Day5 do
  def input do
    File.read!("data/input_day_5")
  end

  def nice?(word) do
    predicates = [
      &three_vowels?/1,
      &double_letter?/1,
      &not_black_listed?/1
    ]
    !!Enum.reduce(predicates, true, fn(fun, acc) ->
      if acc do
        fun.(word)
      end
    end)
  end

  def count_nice(input) do
    input
    |> parse_input
    |> Enum.count(fn(word) -> nice?(word) end)
  end

  defp parse_input(input) do
    input
    |> String.strip
    |> String.split("\n")
  end

  defp three_vowels?(word) do
    ~r/[aeiou]/
    |> Regex.scan(word)
    |> Enum.count >= 3
  end

  defp double_letter?(word) do
    Regex.run(~r/(.)\1/, word)
  end

  defp not_black_listed?(word) do
    ~w(ab cd pq xy)
    |> Enum.map(&Regex.compile!/1)
    |> Enum.all?(fn(regex) -> !Regex.run(regex, word) end)
  end
end
