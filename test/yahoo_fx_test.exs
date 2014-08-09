defmodule YahooFxTest do
  use ExUnit.Case, async: true

  test "URL for currency pair" do
    assert YahooFx.url_for_currency_pair("USD", "UYU") == "http://download.finance.yahoo.com/d/quotes.csv?s=USDUYU=X&f=nl1d1t1"
  end

  test "parsing" do
    body = elem(File.read("test/fixtures/quotes.csv"), 1)
    fetched = {:ok, body }
    assert YahooFx.parse_fetched(fetched) == %{"date" => "8/1/2014", "rate" => "4.2072", "text" => "DKK to UYU", "time" => "2:52pm"}
  end

  test "converting types" do
    map_with_strings = %{"date" => "8/1/2014", "rate" => "4.2072", "text" => "DKK to UYU", "time" => "2:52pm"}
    assert YahooFx.convert_types(map_with_strings) == %{datetime: {{2014,8,1}, {14,52,0}}, rate: 4.2072, text: "DKK to UYU"}
  end

  #  test "fetching from yahoo" do
  #    assert elem(YahooFx.fetch("USD", "UYU"), 0) == :ok
  #  end
end
