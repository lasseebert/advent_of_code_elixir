defmodule Advent.Day7 do
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

  defp to_map(circuit) do
    circuit
  end

  defp parse(line) do
    line
    |> String.split(" ")
    |> Enum.map(&parse_token/1)
  end

  defp parse_token("->"), do: :to
  defp parse_token(val) do
    if Regex.match?(~r/^\d+$/, val) do
      {:contant, String.to_integer(val)}
    else
      {:wire, val}
    end
  end
end
