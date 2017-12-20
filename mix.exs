defmodule RemoveEmoji.Mixfile do
  use Mix.Project

  def project do
    [
      app: :remove_emoji,
      name: "RemoveEmoji",
      version: "1.0.1",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/guanting112/elixir_remove_emoji"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev},
    ]
  end

  defp description() do
    "Remove Emoji 😈🈲😱⁉️ ( 2017 version for Elixir 1.4、1.5+ )"
  end

  defp package do
    [
      name: "remove_emoji",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Guanting Chen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/guanting112/elixir_remove_emoji"}
    ]
  end
end
