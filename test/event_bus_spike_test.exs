defmodule EventBusSpikeTest do
  use ExUnit.Case
  doctest EventBusSpike

  test "greets the world" do
    assert EventBusSpike.hello() == :world
  end
end
