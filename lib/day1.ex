defmodule Day1 do
  @moduledoc """
  Documentation for `Elixir`.
  """

  def read_data(file) do
    File.read!("./data/#{file}")
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def part1(data) do
    (for i <- data, j <- data, i + j == 2020, do: i * j)
    |> List.first()
  end

  def part2(data) do
    (for i <- data, j <- data, k <- data, i+j+k == 2020, do: i*j*k)
    |> List.first()
  end
end
