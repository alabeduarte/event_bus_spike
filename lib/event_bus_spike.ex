defmodule EventBusSpike do
  @subscriber MySubscriber

  alias EventBus.Model.Event

  def start_link() do
    GenServer.start_link(@subscriber, {}, name: @subscriber)

    EventBus.register_topic(:message_received)
    EventBus.subscribe({@subscriber, [".*"]})
  end

  def publish(message) do
    EventBus.notify(%Event{
      id: UUID.uuid4(),
      topic: :message_received,
      data: %{message: message}
    })
  end
end
