YahooFx
=======

[![Build
Status](https://travis-ci.org/lau/yahoo_fx.svg?branch=master)](https://travis-ci.org/lau/yahoo_fx)

Yahoo makes currency rates publicly available. This Elixir library provides a Float with the current exchange rate when you provide the currency pair.

## How to use in an app

### 1) Add YahooFx and hackney as dependencies in mix.exs

    defp deps do
      [
        {:yahoo_fx, "~> 0.2.0"},
        {:hackney, "~> 1.4"},
      ]
    end

Run `mix deps.get` to install the dependencies.

### 2) Add httpoison to applications in mix.exs

    def application do
      [applications: [httpoison]]
    end

### 3) Start using YahooFx to get rates

You can now make calls like this in your app:

    YahooFx.rate(:eur, :usd)

## Examples:

Get the current exchange rate between Euro and US Dollar

    iex> YahooFx.rate("EUR","USD")
    %{datetime: {{2014, 8, 1}, {17, 33, 0}}, rate: 1.3429, text: "EUR to USD"}

    iex> YahooFx.rate(:usd, :dkk)[:rate]
    5.5526

## Date/time issue

It has been observed that Yahoo provides a time and date combination that seems to be incorrect at times. A suspicion is that the time zone for the date is UTC and New York for the time. So for instance at 20:00 during summer in New York the date will change to the next day because at UTC the date has changed, while the time provided will change from 7pm to 8pm.
