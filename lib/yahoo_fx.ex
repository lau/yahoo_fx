defmodule YahooFx do
  def url_for_currency_pair(first, second) do
    "http://download.finance.yahoo.com/d/quotes.csv?s=#{first}#{second}=X&f=nl1d1t1"
  end

  def fetch(first, second) do
    url_for_currency_pair(first, second)
    |> HTTPoison.get
    |> handle_fetch_response
  end

  def handle_fetch_response(%{status_code: 200, body: body}) do {:ok, body} end
  def handle_fetch_response(%{status_code: ___, body: body}) do {:error, body} end

  def parse_fetched({:ok, body}) do
    Regex.named_captures(~r{\"(?<text>[^\"]+)\"\,(?<rate>[0-9\.]+)\,\"(?<date>[^\"]+)\"\,\"(?<time>[^\"]+)\"}, body)
  end

  def convert_types(map_with_strings) do
    %{:datetime => {TimeSeer.date(map_with_strings["date"], :mmddyyyy),
                    TimeSeer.time(map_with_strings["time"])},
      :rate => elem(Float.parse(map_with_strings["rate"]), 0),
      :text => map_with_strings["text"],
      }
  end

  @doc """
  Fetch rate from Yahoo and return map containing exchange rate

  ## Example

      iex> YahooFx.rate("EUR","USD")
      %{datetime: {{2014, 8, 1}, {17, 33, 0}}, rate: 1.3429, text: "EUR to USD"}

  """
  def rate(first, second) do
    fetch(first, second) |> parse_fetched |> convert_types
  end
end
