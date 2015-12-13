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

  defp add(circuit, [{:contant, constant}, :to, {:wire, wire}]) do
    Map.put(circuit, wire, constant)
  end
  defp add(circuit, [{:wire, a}, :and, {:wire, b}, :to, {:wire, c}]) do
    Map.put(circuit, c, fn
      circuit -> get(circuit, a) &&& get(circuit, b)
    end)
  end
  defp add(circuit, [{:wire, a}, :or, {:wire, b}, :to, {:wire, c}]) do
    Map.put(circuit, c, fn
      circuit -> get(circuit, a) ||| get(circuit, b)
    end)
  end

  defp get(circuit, wire) do
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
        Map.put(result, wire, get(circuit, wire))
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
  defp parse_token(val) do
    if Regex.match?(~r/^\d+$/, val) do
      {:contant, String.to_integer(val)}
    else
      {:wire, val}
    end
  end
end
