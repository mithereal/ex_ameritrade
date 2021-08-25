defmodule Ameritrade.MixProject do
  use Mix.Project

  def project do
    [
      app: :ameritrade,
      version: "1.0.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.0"},
      {:oauth2, "~> 1.0 or ~> 2.0"}
    ]
  end
end
