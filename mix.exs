defmodule Lamblichus.MixProject do
  use Mix.Project

  def project do
    [
      app: :lamblichus,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Lamblichus is a elixir macro for implemented functor, like in haskell
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Alfin Surya"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/natserract/lamblichus"}
    ]
  end
end
