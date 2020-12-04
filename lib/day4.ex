defmodule Day4 do
  @moduledoc """
  Documentation for `Elixir`.
  """
  def read_data(file) do
    File.read!("./data/#{file}")
  end

  def parse_data(data) do
    String.split(data, "\n\n")
  end

  def parse_passport(passport_data) do
    String.split(passport_data, [" ", "\n"])
    |> Enum.map(&String.split(&1, [":"]) |> List.to_tuple)
    |> Map.new()
  end

  def valid_passport(%{"byr" => byr, "iyr" => iyr, "eyr" => eyr, "hgt" => hgt, "hcl" => hcl, "ecl" => ecl, "pid" => pid}) do
    true
  end

  def valid_passport(%{}) do
    false
  end

  @eye_color ~w(amb blu brn gry grn hzl oth)

  def valid_passport_part2(%{"byr" => byr, "iyr" => iyr, "eyr" => eyr, "hgt" => hgt, "hcl" => hcl, "ecl" => ecl, "pid" => pid}) do

    height = case Integer.parse(hgt) do
      {cm, "cm"} -> 193 >= cm and cm >= 150
      {inc, "in"} -> 76 >= inc and inc >= 59
      _ -> false
    end

    byr = String.to_integer(byr)
    iyr = String.to_integer(iyr)
    eyr = String.to_integer(eyr)
    
    2002 >= byr and byr >= 1920 and
    2020 >= iyr and iyr >= 2010 and
    2030 >= eyr and eyr >= 2020 and
    height and
    Enum.member?(@eye_color, ecl) and
    Regex.match?(~r/^#[0-9a-f]{6}$/, hcl) and
    Regex.match?(~r/^[0-9]{9}$/, pid)

  end

  def valid_passport_part2(%{}) do
    false
  end

  def part1(data) do
    data
    |> parse_data()
    |> Enum.map(&parse_passport/1)
    |> Enum.count(&valid_passport/1)

  end

  def part2(data) do
    data
    |> parse_data()
    |> Enum.map(&parse_passport/1)
    |> Enum.count(&valid_passport_part2/1)

  end
end
