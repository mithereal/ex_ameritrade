defmodule Ameritrade.MixProject do
  use Mix.Project

  @source_url "https://github.com/mithereal/ex_ameritrade.git"
  @version "1.1.0"

  def project do
    [
      app: :ameritrade,
      version: @version,
      elixir: "~> 1.9",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs(),
      name: "Ameritrade",
      source_url: @source_url
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
      {:oauth2, "~> 1.0 or ~> 2.0"},
      {:inch_ex, ">= 0.0.0", only: [:test, :dev]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "A TD Ameritrade Client for Elixir"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "ameritrade",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/mithereal/ex_ameritrade"}
    ]
  end

  defp docs() do
    [
      main: "readme",
      name: "Ameritrade",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/ameritrade",
      source_url: @source_url,
      extras: ["README.md", "LICENSE"]
    ]
  end
end
