defmodule YahooFx do
  alias HTTPotion.Response

  @user_agent ["User-agent": "Elixir FTW"]

  def url_for_currency_pair(first, second) do
    "http://download.finance.yahoo.com/d/quotes.csv?s=#{first}#{second}=X&f=nl1d1t1"
  end

  def fetch(first, second) do
    response = HTTPotion.get(url_for_currency_pair(first, second), @user_agent)
    return_code = if Response.success?(response), do: :ok, else: :error
    { return_code, response.body }
  end

  def parse_fetched(fetched) do
    body = elem(fetched, 1)
    Regex.named_captures(~r/\"(?<text>[^\"]+)\"\,(?<rate>[0-9\.]+)\,\"(?<date>[^\"]+)\"\,\"(?<time>[^\"]+)\"/, body)
  end

  def convert_types(map_with_strings) do
    %{:date => map_with_strings["date"],
      :rate => elem(Float.parse(map_with_strings["rate"]), 0),
      :text => map_with_strings["text"],
      :time => map_with_strings["time"]}
  end

  @doc """
  Fetch rate from Yahoo and return map containing exchange rate

  ## Example

      iex> YahooFx.data_for_pair("EUR","USD")
      %{date: "8/1/2014", rate: 1.3429, text: "EUR to USD", time: "5:33pm"}

  """
  def rate(first, second) do
    fetch(first, second) |> parse_fetched |> convert_types
  end
end
