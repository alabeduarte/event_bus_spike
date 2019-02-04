# EventBusSpike

Spike wrapping [event_bus](https://github.com/otobus/event_bus)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `event_bus_spike` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:event_bus_spike, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/event_bus_spike](https://hexdocs.pm/event_bus_spike).

## Running locally

```iex
$ iex -S mix

iex(1)> EventBusSpike.subscribe(:foo)
:ok
iex(2)> EventBusSpike.publish(:foo, %{data: "testing"})
:ok
iex(3)>
17:26:46.064 [info]  %EventBus.Model.Event{data: "testing", id: "4f792a50-46f8-4cdd-87d1-029bc390b3b6", initialized_at: nil, occurred_at: nil, source: nil, topic: :foo, transaction_id: nil, ttl: nil}
iex(3)> EventBusSpike.publish(:foo, %{data: "testing 2"})
:ok
iex(4)>
17:26:50.813 [info]  %EventBus.Model.Event{data: "testing 2", id: "e07fda96-1424-4c94-9ac2-e104d139abeb", initialized_at: nil, occurred_at: nil, source: nil, topic: :foo, transaction_id: nil, ttl: nil}
iex(4)> EventBusSpike.publish(:foo, %{data: "testing  3"})
:ok
iex(5)>
17:26:56.524 [info]  %EventBus.Model.Event{data: "testing  3", id: "8676e3c6-7a53-477a-9a3e-75333ff488bc", initialized_at: nil, occurred_at: nil, source: nil, topic: :foo, transaction_id: nil, ttl: nil}
```

## Running tests

```shell
$ mix test
```
