defmodule Day1 do

  def find_best_elf(elf_data) do
    elf_data
    |> separate_elves()
    |> count_calories()
    |> pick_highest_calorie_elf()
  end

  def read_data(filename) do
    {:ok, contents} = File.read(filename)
    String.split(contents, "\n")
  end

  def separate_elves(elf_list) do
    elf_list
    |> Enum.chunk_by(fn(x) -> x != "" end)
    |> Enum.reject(fn(x) -> x == [""] end)
  end

  def pick_highest_calorie_elf([]) do
    {0,0}
  end

  def pick_highest_calorie_elf(list) do
    list |> Enum.max_by(fn ({_index, total}) -> total end)
  end

  def total_calories(list) do
    list
    |> Enum.map(fn(x) -> String.to_integer(x) end)
    |> Enum.sum()
  end

  def count_calories(list) do
    count_calories(0, list)
  end

  def count_calories(_, []) do
    []
  end

  def count_calories(index, [head | tail]) do
    [{index, total_calories(head)}|
    count_calories(index+1, tail)]
  end

end
