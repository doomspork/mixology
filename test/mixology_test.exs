defmodule MixologyTest do
  use ExUnit.Case
  doctest Mixology

  test "greets the world" do
    assert Mixology.hello() == :world
  end
end
