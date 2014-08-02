defmodule YahooFx.Mixfile do
  use Mix.Project

  def project do
    [app: :yahoo_fx,
     version: "0.1.0",
     elixir: "~> 0.14.3",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:httpotion]]
  end

  defp deps do
    [
      {:httpotion, "~> 0.2.4" },
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0"},
    ]
  end

  defp package do
    %{ licenses: ["MIT"],
       contributors: ["Lau Taarnskov"],
       links: %{ "GitHub" => "https://github.com/lau/yahoo_fx" } }
  end
end
