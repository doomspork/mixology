defmodule Fibonacci do
  @moduledoc """

  # Examples

  iex> Fibonacci.run(12)
  [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

  """

  def run(steps) do
    1..steps
    |> Enum.reduce([], &step/2)
    |> Enum.reverse()
  end

  defp step(index, acc) when index in 1..2 do
    [1 | acc]
  end

  defp step(_index, [x, y | _] = acc) do
    [(x + y) | acc]
  end
end
