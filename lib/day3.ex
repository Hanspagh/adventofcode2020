defmodule Day3 do
  @moduledoc """
  Documentation for `Elixir`.
  """

  def read_data(file) do
    File.read!("./data/#{file}")

  end

  def into_streams(lines) do
    lines
    |> Enum.map(&find_trees/1)
    |> Enum.map(&into_stream/1)


  end

  def find_trees(line) do
    trees = line
    |> String.codepoints()
    |> Enum.with_index()
    |> Enum.reduce([], fn {i, idx}, acc -> if i == "#" do [idx | acc] else acc end end)

    {trees, String.length(line)}
  end

  def into_stream({trees, length}) do
    Stream.resource(
      fn -> 0 end,
      fn num ->
        if num == length-1 do
          {[Enum.member?(trees, num)], 0}
        else
          {[Enum.member?(trees, num)], num+1}
        end
      end,
      fn num -> num end
    )
  end

  def part1(data) do
    data
    |> String.trim()
    |> String.split("\n")
    |> into_streams()
    |> Enum.drop(1)
    |> check_slope(3, 1)
  end

  def check_slope(streams, right, down) when down == 1 do
    {res, pos} = streams
    |> Enum.reduce({[], right}, fn stream, {acc, pos} -> {[Enum.at(stream, pos) | acc], pos+right } end)
    Enum.count(res, fn e -> e == true end)
  end

  def check_slope(streams, right, down) do
    {res, pos} = streams
    |> Enum.drop_every(down)
    |> Enum.reduce({[], right}, fn stream, {acc, pos} -> {[Enum.at(stream, pos) | acc], pos+right } end)
    Enum.count(res, fn e -> e == true end)
  end




  def part2(data) do

    stream = data
    |> String.trim()
    |> String.split("\n")
    |> into_streams()
    |> Enum.drop(1)


    check_slope(stream, 1, 1) *
    check_slope(stream, 3, 1) *
    check_slope(stream, 5, 1) *
    check_slope(stream, 7, 1) *
    check_slope(stream, 1, 2)

  end
end
