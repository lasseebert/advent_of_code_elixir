defmodule Advent.Day11 do
  def default_input do
    "hepxcrrq"
  end

  def next_password(old_password) do
    old_password
    |> normalize("")
    |> do_next_password
  end

  defp normalize(<<?i, rest::binary>>, prefix) do
    prefix <> <<?j>> <> String.duplicate("a", String.length(rest))
  end
  defp normalize(<<?l, rest::binary>>, prefix) do
    prefix <> <<?m>> <> String.duplicate("a", String.length(rest))
  end
  defp normalize(<<?o, rest::binary>>, prefix) do
    prefix <> <<?p>> <> String.duplicate("a", String.length(rest))
  end
  defp normalize(<<a, rest::binary>>, prefix) do
    normalize(rest, prefix <> <<a>>)
  end
  defp normalize("", prefix), do: prefix

  defp do_next_password(old_password) do
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
    ([next_digit(digit) | rest] |> Enum.reverse) ++ acc
  end

  defp next_digit(?h), do: ?j
  defp next_digit(?k), do: ?m
  defp next_digit(?n), do: ?p
  defp next_digit(digit), do: digit + 1

  defp valid?(password) do
    [
      &two_pairs?/1,
      &increasing_three?/1
    ]
    |> Enum.all?(fn fun -> fun.(password) end)
  end

  defp increasing_three?(<<a, b, c, rest::binary>>) do
    (a + 1 == b && b + 1 == c) || increasing_three?(<<b, c>> <> rest)
  end
  defp increasing_three?(_), do: false

  defp two_pairs?(password) do
    ~r/(.)\1.*(?!\1)(.)\2/
    |> Regex.match?(password)
  end
end
