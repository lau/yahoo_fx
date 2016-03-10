defmodule YahooFx.Mixfile do
  use Mix.Project

  def project do
    [app: :yahoo_fx,
     version: "0.2.0",
     elixir: "~> 1.1",
     package: package,
     description: description,
     deps: deps]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8" },
      {:time_seer, "~> 0.0.6" }
    ]
  end

  defp package do
    %{ licenses: ["MIT"],
       contributors: ["Lau Taarnskov"],
       links: %{ "GitHub" => "https://github.com/lau/yahoo_fx" } }
  end

  defp description do
    """
    YahooFx is an Elixir library for getting currency exchange rates from Yahoo Finance
    """
  end
end
