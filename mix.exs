defmodule Pangu.Mixfile do
  use Mix.Project

  def project do
    [app: :pangu,
     version: "0.1",
     elixir: "~> 1.1",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end

  defp description do
    """
    Paranoid text spacing in Elixir.
    """
  end

  defp package do
    [
      maintainers: ["Wen-Chun Lin"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/cataska/pangu.ex"}
    ]
  end
end
