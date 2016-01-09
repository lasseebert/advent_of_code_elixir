defmodule Advent.Day08 do
  def input do
    File.read!("data/input_day_08")
    |> String.strip
    |> String.split("\n")
  end

  def overhead(code) do
    ~R/(?:\\")|(?:\\\\)|(?:\\x[a-f0-9]{2})/i
    |> Regex.scan(code)
    |> Enum.reduce(0, fn
      [match], acc ->
        String.length(match) - 1 + acc
      [], acc -> acc
    end)
    |> :erlang.+(2)
  end

  def overheads(codes) do
    codes
    |> Enum.reduce(0, fn code, acc -> overhead(code) + acc end)
  end

  def overhead_2(code) do
    ~R/(?:\\")|(?:\\\\)|(?:\\x[a-f0-9]{2})/i
    |> Regex.scan(code)
    |> Enum.reduce(0, fn
      [~S(\\)], acc ->
        2 + acc
      [~S(\")], acc ->
        2 + acc
      [_ascii], acc ->
        1 + acc
      [], acc ->
        acc
    end)
    |> :erlang.+(4)
  end

  def overheads_2(codes) do
    codes
    |> Enum.reduce(0, fn code, acc -> overhead_2(code) + acc end)
  end
end
