defmodule EventBusSpike.MixProject do
  use Mix.Project

  def project do
    [
      app: :event_bus_spike,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:event_bus],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:event_bus, "~> 1.6.0"},
      {:uuid, "~> 1.1"}
    ]
  end
end
