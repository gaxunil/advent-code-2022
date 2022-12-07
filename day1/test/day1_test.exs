defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "runs the program" do
    data = Day1.read_data("input.txt");
    {elf_number, total_cals} = Day1.find_best_elf(data);

    assert {elf_number, total_cals}  == {126, 66487};

    IO.puts("Elf #{elf_number} has the most calories at  #{total_cals}")
  end

  test "it finds the highest calorie elf" do
    input = ["1", "2", "3", "", "4", "5", "6", "", "7", "8", "9"]
    {elf_number, total_cals} = Day1.find_best_elf(input);

    assert {elf_number, total_cals}  == {2, 24};
  end

  test "it handles empty list" do
    input = []
    {elf_number, total_cals} = Day1.find_best_elf(input);

    assert {elf_number, total_cals}  == {0, 0};
  end
end
