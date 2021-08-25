defmodule Ameritrade do
  @moduledoc """
  Documentation for `Ameritrade`.
  """

  alias Ameritrade.OAuth

  def get_user(token) do
    path = "https://api.tdameritrade.com/v1/userprincipals"
    OAuth.get(token, path)
  end

  def get_account(token, id, fields \\ []) do
    path =
      case(Enum.count(fields)) do
        0 ->
          "https://api.tdameritrade.com/v1/accounts/" <> id

        _ ->
          params = Enum.join(fields, ",")
          "https://api.tdameritrade.com/v1/accounts/#{id}?fields=#{params}"
      end

    def get_accounts(token, id, fields \\ []) do
      path =
        case(Enum.count(fields)) do
          0 ->
            "https://api.tdameritrade.com/v1/accounts"

          _ ->
            params = Enum.join(fields, ",")
            "https://api.tdameritrade.com/v1/accounts/?fields=#{params}"
        end

      OAuth.get(token, path)
    end

    def get_quotes(token) do
      path = "https://api.tdameritrade.com/v1/marketdata/quotes"
      OAuth.get(token, path)
    end

    def get_quote(token, symbol \\ "GOOGL") do
      path = "https://api.tdameritrade.com/v1/marketdata/#{symbol}/quotes"
      OAuth.get(token, path)
    end

    def get_orders_by_path(token, account_id, order_id) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/"
      OAuth.get(token, path)
    end

    def get_orders_by_query(token, %{
          accountId: accountId,
          maxResults: maxResults,
          fromEnteredTime: fromEnteredTime,
          toEnteredTime: toEnteredTime,
          status: status
        }) do
      path =
        "https://api.tdameritrade.com/v1/orders/?accountId=#{accountId}&maxResults=#{maxResults}&fromEnteredTime=#{fromEnteredTime}&toEnteredTime=#{toEnteredTime}&status#{status}"

      OAuth.get(token, path)
    end

    def get_order(token, account_id, order_id) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
      OAuth.get(token, path)
    end

    def cancel_order(token, account_id, order_id) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
      OAuth.delete(token, path)
    end

    def place_order(token, account_id, order) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders"
      OAuth.post(token, path, order)
    end

    def replace_order(token, account_id, order_id, new_order_data) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
      OAuth.put(token, path, new_order_data)
    end
  end

  def create_saved_order(token, account_id, order) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders"
    OAuth.post(token, path, order)
  end

  def delete_saved_order(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders/#{order_id}"

    OAuth.delete(token, path)
  end

  def get_saved_order(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders/#{order_id}"

    OAuth.get(token, path)
  end

  def get_saved_order_by_path(token, account_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders"

    OAuth.get(token, path)
  end

  def get_search_instruments(token, symbol, projection) do
    path =
      "https://api.tdameritrade.com/v1/instruments/?symbol=#{symbol}&projection=#{projection}"

    OAuth.get(token, path)
  end

  def get_instrument(token, cusip) do
    path = "https://api.tdameritrade.com/v1/instruments/#{cusip}"

    OAuth.get(token, path)
  end

  def get_movers(token, index, direction \\ "up", change \\ "value") do
    path =
      "https://api.tdameritrade.com/v1/instruments/#{index}?direction=#{direction}&change=#{change}"

    OAuth.get(token, path)
  end

  def get_option_chain(
        token,
        symbol,
        contractType \\ "ALL",
        strikeCount \\ 0,
        includeQuotes \\ "FALSE",
        strategy \\ "SINGLE",
        interval \\ 0,
        strike \\ 0,
        range \\ "ALL",
        fromDate \\ nil,
        toDate \\ nil,
        volatility \\ nil,
        underlyingPrice \\ nil,
        interestRate \\ nil,
        daysToExpiration \\ nil,
        expMonth \\ "ALL",
        optionType \\ "ALL"
      ) do
    path =
      "https://api.tdameritrade.com/v1/marketdata/chains?symbol=#{symbol}&contractType=#{contractType}&strikeCount=#{strikeCount}&includeQuotes=#{includeQuotes}&strategy=#{strategy}&interval=#{interval}&strike=#{strike}&range=#{range}&toDate=#{toDate}&volatility=#{volatility}&underlyingPrice=#{underlyingPrice}&interestRate=#{interestRate}&daysToExpiration=#{daysToExpiration}&expMonth=#{expMonth}&optionType=#{optionType}"

    OAuth.get(token, path)
  end

  def get_price_history(
        token,
        symbol,
        periodType \\ "ALL",
        period \\ nil,
        frequencyType \\ "minute",
        frequency \\ "minute",
        endDate \\ nil,
        startDate \\ nil,
        needExtendedHoursData \\ "TRUE"
      ) do
    path =
      case endDate != nil && startDate != nil do
        true ->
          "https://api.tdameritrade.com/v1/marketdata/#{symbol}/pricehistory?&periodType=#{periodType}&frequencyType=#{frequencyType}&frequency=#{frequency}&endDate=#{endDate}&startDate=#{startDate}&needExtendedHoursData=#{needExtendedHoursData}"

        false ->
          "https://api.tdameritrade.com/v1/marketdata/#{symbol}/pricehistory?&periodType=#{periodType}&period=#{period}&frequencyType=#{frequencyType}&frequency=#{frequency}&needExtendedHoursData=#{needExtendedHoursData}"
      end

    OAuth.get(token, path)
  end

  def get_transaction(token, accountId, transactionId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/transactions/#{transactionId}"

    OAuth.get(token, path)
  end

  def get_transactions(token, accountId, symbol, startDate, endDate) do
    path =
      "https://api.tdameritrade.com/v1/accounts/#{accountId}/transactions?symbol=#{symbol}&startDate=#{startDate}&endDate=#{endDate}"

    OAuth.get(token, path)
  end

  def create_watchlist(token, accountId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists"

    OAuth.post(token, path)
  end

  def delete_watchlist(token, accountId, watchlistId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.delete(token, path)
  end

  def get_multiple_watchlist(token, accountId, watchlistId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.get(token, path)
  end

  def get_watchlists(token, accountId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists"

    OAuth.get(token, path)
  end

  def replace_watchlist(token, accountId, watchlistId, value) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.put(token, path, value)
  end

  def update_watchlist(token, accountId, watchlistId, value) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.patch(token, path, value)
  end
end
