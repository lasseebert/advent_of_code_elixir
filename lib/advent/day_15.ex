defmodule Advent.Day15 do
  def example_input do
    """
    Sprinkles: capacity 2, durability 0, flavor -2, texture 0, calories 3
    Butterscotch: capacity 0, durability 5, flavor -3, texture 0, calories 3
    Chocolate: capacity 0, durability 0, flavor 5, texture -1, calories 8
    Candy: capacity 0, durability -1, flavor 0, texture 5, calories 8
    """
  end

  def best_cookie_score(input, calories \\ nil) do
    input
    |> parse
    |> do_best_cookie_score(calories)
  end

  def do_best_cookie_score(data, nil) do
    data
    |> permutations(100, %{})
    |> List.flatten
    |> Enum.map(&score/1)
    |> Enum.max
  end

  def do_best_cookie_score(data, calories) do
    data
    |> permutations(100, %{})
    |> List.flatten
    |> Enum.filter(fn recipe -> count(recipe, "calories") == calories end)
    |> Enum.map(&score/1)
    |> Enum.max
  end

  def score(recipe) do
    for property <- ~w(capacity durability flavor texture) do
      recipe
      |> count(property)
    end
    |> Enum.reduce(1, fn amount, acc -> Enum.max([0, amount]) * acc end)
  end

  def count(recipe, property) do
    recipe
    |> Enum.map(fn
      {{_name, %{^property => property_amount}}, ingredient_amount} ->
        property_amount * ingredient_amount
    end)
    |> Enum.reduce(0, &(&1 + &2))
  end

  def permutations([last], amount_left, assigned) do
    assigned
    |> Map.put(last, amount_left)
  end
  def permutations([first | rest], amount_left, assigned) do
    for amount <- 0..amount_left do
      permutations(rest, amount_left - amount, Map.update(assigned, first, amount, fn a -> a + amount end))
    end
  end

  def parse(input) do
    input
    |> String.strip
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
  end

  def parse_line(line) do
    [name, properties] = line
                          |> String.strip
                          |> String.split(": ")
    {name, parse_properties(properties)}
  end

  def parse_properties(properties) do
    properties
    |> String.split(", ")
    |> Enum.map(&parse_property/1)
    |> List.flatten
    |> Enum.into(%{})
  end

  def parse_property(property) do
    with [name, value] <- String.split(property, " "),
    do: {name, String.to_integer(value)}
  end
end
