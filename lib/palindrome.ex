defmodule Palindrome do
  @moduledoc """
  Given a string of characters determine all of the valid palindrome permutations.
  """

  @spec run(String.t) :: :ok

  def run(str) do
    str
    |> tokenize()
    |> generate()
    |> print()
  end

  defp create([mutation|_] = mutations, middle) when is_list(mutations) and is_list(mutation) do
    Enum.map(mutations, &create(&1, middle))
  end
  defp create(mutation, middle) do
    the_start = Enum.join(mutation)
    the_end =
      mutation
      |> Enum.reverse()
      |> Enum.join()

    Enum.join([the_start, middle, the_end])
  end

  defp generate({even, odd}) do
    middle = Enum.join(odd)

    even
    |> permutations()
    |> create(middle)
  end

  def permutations(collection), do: permutations(collection, [], [])

  defp permutations([], pick, acc), do: [pick | acc]
  defp permutations(list, pick, acc) do
    list
    |> Stream.unfold(fn [h | t] -> {{h, t}, t ++ [h]} end)
    |> Enum.take(Enum.count(list))
    |> Enum.reduce(acc, fn {h, t}, acc -> permutations(t, [h | pick], acc) end)
  end

  defp print(palindromes) do
    palindromes
    |> Enum.join("\n")
    |> IO.puts()
  end

  defp reducer([char|_] = list, {even, odd}) when length(list) == 1 do
    {even, [char|odd]}
  end
  defp reducer([char|_] = list, {even, odd}) when rem(length(list), 2) == 0 do
    mod = div(length(list), 2)
    {List.duplicate(char, mod) ++ even, odd}
  end
  defp reducer([char|_] = list, {even, odd}) do
    mod = div(length(list), 2)
    {List.duplicate(char, mod) ++ even, [char|odd]}
  end

  defp tokenize(str) do
    str
    |> String.split("", trim: true)
    |> Enum.group_by(&(&1))
    |> Map.values()
    |> Enum.reduce({[], []}, &reducer/2)
  end
end
