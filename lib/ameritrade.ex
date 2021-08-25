defmodule Ameritrade do
  @moduledoc """
  Documentation for `Ameritrade`.
  """

  alias Ameritrade.OAuth

  @doc """
  User Principal details.

  """
  def get_user_principals(token) do
    path = "https://api.tdameritrade.com/v1/userprincipals"
    OAuth.get(token, path)
  end

  @doc """
  Preferences for a specific account.
  """
  def get_user_preferences(token, account_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/preferences"
    OAuth.get(token, path)
  end

  @doc """
  Preferences for a specific account.
  """
  def get_streamer_subscription_keys(token, account_ids) do
    path =
      "https://api.tdameritrade.com/v1/userprincipals/streamersubscriptionkeys&accountIds=#{account_ids}"

    OAuth.get(token, path)
  end

  @doc """
  Update preferences for a specific account.

  Please note that the directOptionsRouting and directEquityRouting values cannot be modified via this operation.
  """
  def update_preferences(token, account_id, values) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/preferences"
    OAuth.put(token, path, values)
  end

  @doc """
  Account balances, positions, and orders for a specific account.
  """
  def get_account(token, id, fields \\ []) do
    path =
      case(Enum.count(fields)) do
        0 ->
          "https://api.tdameritrade.com/v1/accounts/" <> id

        _ ->
          params = Enum.join(fields, ",")
          "https://api.tdameritrade.com/v1/accounts/#{id}?fields=#{params}"
      end

    @doc """
    Account balances, positions, and orders for all linked accounts.
    """
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

    @doc """
    Get quote for one or more symbols

    """
    def get_quotes(token) do
      path = "https://api.tdameritrade.com/v1/marketdata/quotes"
      OAuth.get(token, path)
    end

    @doc """
    Get quote for a symbol

    """
    def get_quote(token, symbol \\ "GOOGL") do
      path = "https://api.tdameritrade.com/v1/marketdata/#{symbol}/quotes"
      OAuth.get(token, path)
    end

    @doc """
    Orders for a specific account.
    """
    def get_orders_by_path(token, account_id, order_id) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/"
      OAuth.get(token, path)
    end

    @doc """
    All orders for a specific account or, if account ID isn't specified, orders will be returned for all linked accounts.
    """
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

    @doc """
    Get a specific order for a specific account.
    """
    def get_order(token, account_id, order_id) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
      OAuth.get(token, path)
    end

    @doc """
    Cancel a specific order for a specific account.   Order throttle limits may apply.  Click here for to see our Place Order Samples Guide for more information around order throttles and examples of orders.
    """
    def cancel_order(token, account_id, order_id) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
      OAuth.delete(token, path)
    end

    @doc """
    Place an order for a specific account.   Order throttle limits may apply.  Click here for to see our Place Order Samples Guide for more information around order throttles and examples of orders.
    """
    def place_order(token, account_id, order) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders"
      OAuth.post(token, path, order)
    end

    @doc """
    Replace an existing order for an account. The existing order will be replaced by the new order. Once replaced, the old order will be canceled and a new order will be created.   Order throttle limits may apply.  Click here for to see our Place Order Samples Guide for more information around order throttles and examples of orders.
    """
    def replace_order(token, account_id, order_id, new_order_data) do
      path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
      OAuth.put(token, path, new_order_data)
    end
  end

  @doc """
  Save an order for a specific account. Click here for to see our Place Order Samples Guide.
  """
  def create_saved_order(token, account_id, order) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders"
    OAuth.post(token, path, order)
  end

  @doc """
  Delete a specific saved order for a specific account.
  """
  def delete_saved_order(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders/#{order_id}"

    OAuth.delete(token, path)
  end

  @doc """
  Specific saved order by its ID, for a specific account.
  """
  def get_saved_order(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders/#{order_id}"

    OAuth.get(token, path)
  end

  @doc """
  Saved orders for a specific account.
  """
  def get_saved_orders_by_path(token, account_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders"

    OAuth.get(token, path)
  end

  @doc """
  Replace an existing saved order for an account. The existing saved order will be replaced by the new order. Click here for to see our Place Order Samples Guide.
  """
  def replace_saved_order(token, account_id, saved_order_id, values) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders/#{saved_order_id}"

    OAuth.put(token, path, values)
  end

  @doc """
  Search or retrieve instrument data, including fundamental data.
  """
  def get_search_instruments(token, symbol, projection) do
    path =
      "https://api.tdameritrade.com/v1/instruments/?symbol=#{symbol}&projection=#{projection}"

    OAuth.get(token, path)
  end

  @doc """
  Get an instrument by CUSIP
  """
  def get_instrument(token, cusip) do
    path = "https://api.tdameritrade.com/v1/instruments/#{cusip}"

    OAuth.get(token, path)
  end

  @doc """
  Top 10 (up or down) movers by value or percent for a particular market
  """
  def get_movers(token, index, direction \\ "up", change \\ "value") do
    path =
      "https://api.tdameritrade.com/v1/instruments/#{index}?direction=#{direction}&change=#{change}"

    OAuth.get(token, path)
  end

  @doc """
  Get option chain for an optionable Symbol
  """
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

  @doc """
  Get price history for a symbol
  """
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

  @doc """
  Transaction for a specific account.

  """
  def get_transaction(token, accountId, transactionId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/transactions/#{transactionId}"

    OAuth.get(token, path)
  end

  @doc """
  Transactions for a specific account.

  """
  def get_transactions(token, accountId, symbol, startDate, endDate) do
    path =
      "https://api.tdameritrade.com/v1/accounts/#{accountId}/transactions?symbol=#{symbol}&startDate=#{startDate}&endDate=#{endDate}"

    OAuth.get(token, path)
  end

  @doc """
  Create watchlist for specific account.This method does not verify that the symbol or asset type are valid.
  """
  def create_watchlist(token, accountId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists"

    OAuth.post(token, path)
  end

  @doc """
  Delete watchlist for a specific account.

  """
  def delete_watchlist(token, accountId, watchlistId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.delete(token, path)
  end

  @doc """
  All watchlists for all of the user's linked accounts.

  """
  def get_multiple_watchlist(token, accountId, watchlistId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.get(token, path)
  end

  @doc """
   Specific watchlist for a specific account.

  """
  def get_watchlists(token, accountId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists"

    OAuth.get(token, path)
  end

  @doc """
  Replace watchlist for a specific account. This method does not verify that the symbol or asset type are valid.

  """
  def replace_watchlist(token, accountId, watchlistId, value) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.put(token, path, value)
  end

  @doc """
  Partially update watchlist for a specific account: change watchlist name, add to the beginning/end of a watchlist, update or delete items in a watchlist. This method does not verify that the symbol or asset type are valid.

  """
  def update_watchlist(token, accountId, watchlistId, value) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.patch(token, path, value)
  end
end
