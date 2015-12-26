defmodule Advent.Day11 do
  def default_input do
    "hepxcrrq"
  end

  def next_password(old_password) do
    next = increment(old_password)
    if valid?(next) do
      next
    else
      next_password(next)
    end
  end

  defp increment(password) do
    password
    |> String.to_char_list
    |> increment_digit
    |> List.to_string
  end

  defp increment_digit(list) do
    list
    |> Enum.reverse
    |> increment_digit([])
  end

  defp increment_digit([?z | rest], acc) do
    increment_digit(rest, [?a | acc])
  end
  defp increment_digit([digit | rest], acc) do
    ([digit + 1 | rest] |> Enum.reverse) ++ acc
  end

  defp valid?(password) do
    [
      &illegal_letters?/1,
      &two_pairs?/1,
      &increasing_three?/1
    ]
    |> Enum.all?(fn fun -> fun.(password) end)
  end

  defp increasing_three?(<<a, b, c, rest::binary>>) do
    (a + 1 == b && b + 1 == c) || increasing_three?(<<b, c>> <> rest)
  end
  defp increasing_three?(_), do: false

  defp illegal_letters?(password) do
    ~r/^[^iol]*$/
    |> Regex.match?(password)
  end

  defp two_pairs?(password) do
    ~r/(.)\1.*(?!\1)(.)\2/
    |> Regex.match?(password)
  end
end
