defmodule DayOne do
  def load_puzzle_input() do
    File.read!("input/day_one.txt")
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(fn string ->
      string |> String.split() |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.map(&Enum.sum/1)
  end

  def calories_of_three_most_provisioned_elves() do
    load_puzzle_input()
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  def calories_of_most_provisioned_elf() do
    load_puzzle_input()
    |> Enum.max()
  end
end

IO.puts(DayOne.calories_of_most_provisioned_elf())
IO.puts(DayOne.calories_of_three_most_provisioned_elves())
