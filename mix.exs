defmodule YahooFx.Mixfile do
  use Mix.Project

  def project do
    [app: :yahoo_fx,
     version: "0.1.2",
     elixir: "~> 0.15.0",
     package: package,
     description: description,
     deps: deps]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.3.2" },
      {:hackney, "~> 0.13.1" },
      {:time_seer, "~> 0.0.4" }
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
