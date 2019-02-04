defmodule EventBusSpike do
  @subscriber Bus.Subscriber
  alias EventBus.Model.Event

  def subscribe(topic) do
    GenServer.start_link(@subscriber, {}, name: @subscriber)

    EventBus.register_topic(topic)
    EventBus.subscribe({@subscriber, [".*"]})
  end

  def publish(topic, payload, event_id \\ UUID.uuid4()) do
    EventBus.notify(%Event{
      topic: topic,
      id: event_id,
      data: payload.data
    })
  end
end
