YahooFx
=======

[![Build
Status](https://travis-ci.org/lau/yahoo_fx.svg?branch=master)](https://travis-ci.org/lau/yahoo_fx)

Yahoo makes currency rates publicly available. This Elixir library provides a Float with the current exchange rate when you provide the currency pair.

## How to use in an app

### 1) Add YahooFx and ibrowse as dependencies in mix.exs

    defp deps do
      [
        {:yahoo_fx, "~> 0.1.0"},
        {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0"},
      ]
    end

Run ´mix deps.get´ to install the dependencies.

### 2) Add httpotion to applications in the mix.exs file of the app

    def application do
      [applications: [:httpotion]]
    end

### 3) Start using YahooFx to get rates

You can now make calls like this in your app:

    YahooFx.rate(:eur, :usd)

## Examples:

Get the current exchange rate between Euro and US Dollar

    iex> YahooFx.data_for_pair("EUR","USD")
    %{date: "8/1/2014", rate: 1.3429, text: "EUR to USD", time: "5:33pm"}

    iex> YahooFx.rate(:usd, :dkk)[:rate]
    5.5526

