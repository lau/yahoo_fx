YahooFx
=======

[![Build
Status](https://travis-ci.org/lau/yahoo_fx.svg?branch=master)](https://travis-ci.org/lau/yahoo_fx)

Yahoo makes currency rates publicly available. This Elixir library provides a Float with the current exchange rate when you provide the currency pair.

## Examples:

Get the current exchange rate between Euro and US Dollar

    iex> YahooFx.data_for_pair("EUR","USD")
    %{date: "8/1/2014", rate: 1.3429, text: "EUR to USD", time: "5:33pm"}

    iex> YahooFx.rate(:usd, :dkk)[:rate]
    5.5526

