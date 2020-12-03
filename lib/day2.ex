defmodule Day2 do
  @moduledoc """
  Documentation for `Elixir`.
  """

  def read_data(file) do
    File.read!("./data/#{file}")

  end

  def parse_data(line) do
    [policy, letter, pass] = String.split(line, " ")
    [min, max] = String.split(policy, "-")
    letter = String.replace(letter, ":", "")
    {String.to_integer(min), String.to_integer(max),  letter, pass}
  end

  def fit_policy({min, max, letter, password}) do
    count =
      password
      |> String.codepoints()
      |> Enum.count(fn l -> l == letter end)
    count >= min && count <= max
  end

  def fit_new_policy({min, max, letter, password}) do
    letters = password
    |> String.codepoints()

    pos1 = Enum.at(letters, min-1) == letter
    pos2 = Enum.at(letters, max-1) == letter

    pos1 != pos2
  end

  def part1(data) do
    data
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse_data/1)
    |> Enum.count(&fit_policy/1)

  end

  def part2(data) do
    data
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse_data/1)
    |> Enum.count(&fit_new_policy/1)
  end
end
