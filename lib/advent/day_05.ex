defmodule Advent.Day05 do
  def input do
    File.read!("data/input_day_05")
  end

  def count_nice(input, fun) do
    input
    |> parse_input
    |> Enum.count(fun)
  end

  defp parse_input(input) do
    input
    |> String.strip
    |> String.split("\n")
  end
end

defmodule Advent.Day05_1 do
  alias Advent.Day05

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
    Day05.count_nice(input, &nice?/1)
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

defmodule Advent.Day05_2 do
  alias Advent.Day05

  def nice?(word) do
    regexes = [
      ~r/(..).*\1/,
      ~r/(.).\1/
    ]
    regexes
    |> Enum.all?(fn(regex) -> Regex.run(regex, word) end)
  end

  def count_nice(input) do
    Day05.count_nice(input, &nice?/1)
  end
end
