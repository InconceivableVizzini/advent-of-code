defmodule DayOne do
  def load_puzzle_input() do
    File.read!("input/day_one.txt")
    |> String.split("\n\n", trim: true)
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

defmodule DayTwo do
  def load_puzzle_input() do
    File.read!("input/day_two.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn input ->
      input
      |> String.split(" ", trim: true)
    end)
    |> Enum.map(fn [their_play, my_play] ->
      [
        case their_play do
          "A" -> 1
          "B" -> 2
          "C" -> 3
        end,
        case my_play do
          "X" -> 1
          "Y" -> 2
          "Z" -> 3
        end
      ]
    end)
  end

  def score_using_misunderstood_strategy_guide() do
    load_puzzle_input()
    |> score_the_game
  end

  def score_using_actual_strategy_guide() do
    load_puzzle_input()
    |> Enum.map(fn [their_play, my_play_outcome] ->
      [
        their_play,
        case their_play do
          1 ->
            case my_play_outcome do
              1 -> 3
              2 -> 1
              3 -> 2
            end

          2 ->
            my_play_outcome

          3 ->
            case my_play_outcome do
              1 -> 2
              2 -> 3
              3 -> 1
            end
        end
      ]
    end)
    |> score_the_game
  end

  def score_the_game(the_plays) do
    the_plays
    |> Enum.map(fn [their_play, my_play] ->
      score(their_play, my_play)
    end)
    |> Enum.sum()
  end

  def score(1, 1), do: 4
  def score(1, 2), do: 8
  def score(1, 3), do: 3
  def score(2, 1), do: 1
  def score(2, 2), do: 5
  def score(2, 3), do: 9
  def score(3, 1), do: 7
  def score(3, 2), do: 2
  def score(3, 3), do: 6
end

IO.puts(DayOne.calories_of_most_provisioned_elf())
IO.puts(DayOne.calories_of_three_most_provisioned_elves())
IO.puts(DayTwo.score_using_misunderstood_strategy_guide())
IO.puts(DayTwo.score_using_actual_strategy_guide())
