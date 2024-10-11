defmodule TelemetryDeployex.MixProject do
  use Mix.Project

  @version "0.1.0-rc3"

  def project do
    [
      app: :telemetry_deployex,
      version: @version,
      elixir: "~> 1.16",
      name: "TelemetryDeployex",
      source_url: "https://github.com/thiagoesteves/telemetry_deployex",
      homepage_url: "https://github.com/thiagoesteves/telemetry_deployex",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      preferred_cli_env: preferred_cli_env(),
      deps: deps(),
      dialyzer: [ignore_warnings: ".dialyzer_ignore.exs"],
      docs: docs(),
      package: package(),
      description: description()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib/", "test/support/"]
  defp elixirc_paths(_), do: ["lib/"]

  defp preferred_cli_env do
    [
      dialyzer: :test,
      format: :test
    ]
  end

  defp description do
    """
    Telemetry.Metrics reporter for DeployEx
    """
  end

  defp package do
    [
      files: [
        "lib",
        "priv",
        "mix.exs",
        "README.md",
        "LICENSE.md",
        "CHANGELOG.md",
        ".formatter.exs"
      ],
      maintainers: ["Thiago Esteves"],
      licenses: ["MIT"],
      links: %{
        Documentation: "https://hexdocs.pm/telemetry_deployex",
        Changelog: "https://hexdocs.pm/telemetry_deployex/changelog.html",
        GitHub: "https://github.com/thiagoesteves/telemetry_deployex"
      }
    ]
  end

  defp docs do
    [
      main: "TelemetryDeployex",
      source_ref: "v#{@version}",
      extras: ["README.md", "LICENSE.md", "CHANGELOG.md"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:telemetry, "~> 0.4 or ~> 1.0"},
      {:telemetry_metrics, "~> 0.6 or ~> 1.0"},
      {:ex_doc, "~> 0.34", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: :test, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end
end
