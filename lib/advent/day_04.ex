defmodule Advent.Day04 do
  def input do
    "yzbqklnj"
  end

  def mine_advent_coin(secret, number \\ 1) do
    case md5(secret <> Integer.to_string(number)) do
      <<0 :: size(20), _ :: size(4)>> <> _ -> number
      _ -> mine_advent_coin(secret, number + 1)
    end
  end

  def mine_hard_advent_coin(secret, number \\ 1) do
    case md5(secret <> Integer.to_string(number)) do
      <<0 :: size(24)>> <> _ -> number
      _ -> mine_hard_advent_coin(secret, number + 1)
    end
  end

  defp md5(string), do: :crypto.hash(:md5, string)
end
