defmodule WordCount do
  @moduledoc """

  ## Examples

  iex> WordCount.run("./priv/charge_of_the_light_brigade.txt")
  [{"the", 25}, {"of", 14}, {"and", 9}, {"them", 7}, {"six", 7},
   {"hundred", 7}, {"to", 7}, {"they", 7}, {"cannon", 6}, {"rode", 6}]

  iex> WordCount.run("nonexistant.txt")
  "File not found"
  """

  def run(file) do
    file
    |> read()
    |> parse()
    |> sum_words()
    |> top10()
  end

  defp read(file), do: File.read(file)

  defp parse({:error, _} = errs), do: errs
  defp parse({:ok, result}) do
    result
    |> String.downcase
    |> String.replace(~r/[^\w\s]/, "")
    |> String.split(~r/\s/, trim: true)
  end

  defp sum_words({:error, _} = errs), do: errs
  defp sum_words(word_list) do
    Enum.reduce(word_list, %{}, fn(word, memo) ->
      Map.update(memo, word, 1, &(&1 + 1))
    end)
  end

  defp top10({:error, _}), do: "File not found"
  defp top10(word_map) do
    word_map
    |> Enum.sort_by(&elem(&1, 1), &>=/2)
    |> Enum.take(10)
  end
end
