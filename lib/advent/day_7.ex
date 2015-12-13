defmodule Advent.Day7 do
  use Bitwise

  def new do
    %{}
  end

  def run_task_input do
    File.read!("data/input_day_7")
    |> String.strip
    |> String.split("\n")
    |> Enum.reduce(new, fn line, circuit -> add(circuit, parse(line)) end)
    |> get({:wire, "a"})
  end

  def run_task_input_2 do
    circuit = File.read!("data/input_day_7")
              |> String.strip
              |> String.split("\n")
              |> Enum.reduce(new, fn line, circuit -> add(circuit, parse(line)) end)

    value_a = get(circuit, {:wire, "a"})

    circuit
    |> Enum.each(fn
      {"b", pid} -> Agent.update(pid, fn {fun, _value} -> {fun, value_a} end)
      {_wire, pid} -> Agent.update(pid, fn {fun, _value} -> {fun, nil} end)
    end)

    circuit
    |> get({:wire, "a"})
  end

  def run(input) do
    input
    |> Enum.reduce(new, fn line, circuit -> add(circuit, parse(line)) end)
    |> to_map
  end

  defp add(circuit, [a, :to, {:wire, b}]) do
    add(circuit, b, fn
      circuit -> get(circuit, a)
    end)
  end
  defp add(circuit, [a, :and, b, :to, {:wire, c}]) do
    add(circuit, c, fn
      circuit -> get(circuit, a) &&& get(circuit, b)
    end)
  end
  defp add(circuit, [a, :or, b, :to, {:wire, c}]) do
    add(circuit, c, fn
      circuit -> get(circuit, a) ||| get(circuit, b)
    end)
  end
  defp add(circuit, [a, :lshift, b, :to, {:wire, c}]) do
    add(circuit, c, fn
      circuit -> left_shift(get(circuit, a), get(circuit, b))
    end)
  end
  defp add(circuit, [a, :rshift, b, :to, {:wire, c}]) do
    add(circuit, c, fn
      circuit -> get(circuit, a) >>> get(circuit, b)
    end)
  end
  defp add(circuit, [:not, a, :to, {:wire, b}]) do
    add(circuit, b, fn
      circuit -> 65535 - get(circuit, a)
    end)
  end

  defp add(circuit, wire, fun) do
    with {:ok, pid} <- Agent.start_link(fn -> {fun, nil} end),
    do: Map.put(circuit, wire, pid)
  end

  defp get(_circuit, {:constant, constant}), do: constant
  defp get(circuit, {:wire, wire}) do
    pid = circuit[wire]
    case Agent.get(pid, &(&1)) do
      {fun, nil} ->
        value = fun.(circuit)
        Agent.update(pid, fn {fun, _} -> {fun, value} end)
        value
      {_fun, value} ->
        value
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
