defmodule LoggerSubscriber do
  require Logger

  def process(event_shadow) do
    GenServer.cast(__MODULE__, event_shadow)
    :ok
  end

  def init(initial_state) do
    {:ok, initial_state}
  end

  def handle_cast({topic, id}, state) do
    event = EventBus.fetch_event({topic, id})
    Logger.info(fn -> inspect(event) end)

    {:noreply, state}
  end
end
