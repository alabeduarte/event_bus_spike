defmodule EventBusSpike do
  alias EventBus.Model.Event

  def subscribe(topic, subscriber \\ LoggerSubscriber) do
    EventBus.register_topic(topic)
    EventBus.subscribe({subscriber, [".*"]})

    GenServer.start_link(subscriber, :ok, name: subscriber)
  end

  def publish(topic, payload, event_id \\ UUID.uuid4()) do
    EventBus.notify(%Event{
      topic: topic,
      id: event_id,
      data: payload.data
    })
  end
end
