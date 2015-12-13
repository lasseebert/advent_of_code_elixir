defmodule Advent.Day7 do
  use Bitwise

  def new do
    %{}
  end

  def run(input) do
    input
    |> Enum.reduce(new, fn line, circuit -> add(circuit, parse(line)) end)
    |> to_map
  end

  defp add(circuit, [a, :to, {:wire, b}]) do
    Map.put(circuit, b, fn
      circuit -> get(circuit, a)
    end)
  end
  defp add(circuit, [a, :and, b, :to, {:wire, c}]) do
    Map.put(circuit, c, fn
      circuit -> get(circuit, a) &&& get(circuit, b)
    end)
  end
  defp add(circuit, [a, :or, b, :to, {:wire, c}]) do
    Map.put(circuit, c, fn
      circuit -> get(circuit, a) ||| get(circuit, b)
    end)
  end
  defp add(circuit, [a, :lshift, b, :to, {:wire, c}]) do
    Map.put(circuit, c, fn
      circuit -> left_shift(get(circuit, a), get(circuit, b))
    end)
  end
  defp add(circuit, [a, :rshift, b, :to, {:wire, c}]) do
    Map.put(circuit, c, fn
      circuit -> get(circuit, a) >>> get(circuit, b)
    end)
  end
  defp add(circuit, [:not, a, :to, {:wire, b}]) do
    Map.put(circuit, b, fn
      circuit -> 65535 - get(circuit, a)
    end)
  end

  defp get(circuit, {:constant, constant}), do: constant
  defp get(circuit, {:wire, wire}) do
    case circuit do
      %{^wire => value} when is_number(value) ->
        value
      %{^wire => fun} ->
        fun.(circuit)
    end
  end

  defp to_map(circuit) do
    circuit
    |> Map.keys
    |> Enum.reduce(%{}, fn
      wire, result ->
        Map.put(result, wire, get(circuit, {:wire, wire}))
    end)
  end

  defp parse(line) do
    line
    |> String.split(" ")
    |> Enum.map(&parse_token/1)
  end

  defp parse_token("->"), do: :to
  defp parse_token("AND"), do: :and
  defp parse_token("OR"), do: :or
  defp parse_token("LSHIFT"), do: :lshift
  defp parse_token("RSHIFT"), do: :rshift
  defp parse_token("NOT"), do: :not
  defp parse_token(val) do
    if Regex.match?(~r/^\d+$/, val) do
      {:constant, String.to_integer(val)}
    else
      {:wire, val}
    end
  end

  defp left_shift(value, 0), do: value
  defp left_shift(value, count) do
    ((value <<< 1) &&& 65535) # 16 bit
    |> left_shift(count - 1)
  end
end
