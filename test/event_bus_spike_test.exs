defmodule EventBusSpikeTest do
  use ExUnit.Case
  alias EventBus.Model.Event

  setup do
    EventBusSpike.subscribe(:foo)
  end

  test "receives message from subscribed bus" do
    Process.sleep(500)

    EventBusSpike.publish(
      :foo,
      %{
        data: "test"
      },
      "123"
    )

    Process.sleep(500)

    event = EventBus.fetch_event({:foo, "123"})

    assert event == %Event{
             id: "123",
             topic: :foo,
             data: "test"
           }
  end
end
