defmodule ApolloSignal.MixProject do
  use Mix.Project

  def project do
    [
      app: :apollo_signal,
      version: "1.0.4",
      description: description(),
      package: package(),
      source_url: "https://github.com/Apollo-Deploy/signal-sdks",
      homepage_url: "https://github.com/Apollo-Deploy/signal-sdks",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger, :inets]]
  end

  defp deps do
    [
      {:req, "~> 0.5"},
      {:jason, "~> 1.4"}
    ]
  end

  defp description do
    "Elixir SDK for the Apollo Signal API"
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Apollo-Deploy/signal-sdks"},
      files: ["lib", "mix.exs", "README.md", "LICENSE", "docs"]
    ]
  end
end
