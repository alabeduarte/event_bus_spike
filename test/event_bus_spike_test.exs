defmodule EventBusSpikeTest do
  use ExUnit.Case
  alias EventBus.Model.Event

  @topic :message_received

  defmodule TestSubscriber do
    def process(event_shadow) do
      GenServer.cast(__MODULE__, event_shadow)
      :ok
    end

    def init(:ok) do
      {:ok, {}}
    end

    def handle_cast(_event_shadow, state) do
      {:noreply, state}
    end
  end

  test "publish events into the event bus" do
    EventBusSpike.subscribe(@topic, TestSubscriber)
    Process.sleep(500)

    EventBusSpike.publish(
      @topic,
      %{
        data: %{message: "testing"}
      },
      "999"
    )

    Process.sleep(500)

    assert %Event{
             id: "999",
             topic: @topic,
             data: %{message: "testing"}
           } == EventBus.fetch_event({@topic, "999"})
  end
end
