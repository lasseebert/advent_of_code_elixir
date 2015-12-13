defmodule Advent.Day8 do
  def input do
    File.read!("data/input_day_8")
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
end
