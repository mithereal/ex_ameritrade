defmodule AmeritradeTest do
  use ExUnit.Case
  doctest Ameritrade

  test "greets the world" do
    assert Ameritrade.hello() == :world
  end
end
