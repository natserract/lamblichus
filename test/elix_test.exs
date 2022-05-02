defmodule ElixTest do
  use ExUnit.Case
  doctest Elix

  test "greets the world" do
    assert Elix.hello() == :world
  end
end
