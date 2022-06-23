defmodule Ameritrade do
  @moduledoc """
  Documentation for `Ameritrade`.
  """

  alias Ameritrade.OAuth

  @doc """
  User Principal details.

  ## Example
        
        iex>  Ameritrade.get_user_principals(token)

  """
  def get_user_principals(token) do
    path = "https://api.tdameritrade.com/v1/userprincipals"
    OAuth.get(token, path)
  end

  @doc """
  User Principal details.

  ## Example

        iex>  Ameritrade.get_user_principals(token, ["streamerSubscriptionKeys"])

  """
  def get_user_principals(token, fields) do
    fields = Enum.join(fields, ",")
    path = "https://api.tdameritrade.com/v1/userprincipals?fields=#{fields}"
    OAuth.get(token, path)
  end

  @doc """
  Preferences for a specific account.

  ## Example

        iex>  Ameritrade.get_user_preferences(token, account_id)
  """
  def get_user_preferences(token, account_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/preferences"
    OAuth.get(token, path)
  end

  @doc """
  Preferences for a specific account.

  ## Example

        iex>  Ameritrade.get_user_preferences!(token, account_id)
  """
  def get_user_preferences!(token, account_id) do
    {_status, json} = get_user_preferences(token, account_id)

    json
  end

  @doc """
  Preferences for a specific account.

  ## Example

         iex>  Ameritrade.get_streamer_subscription_keys(token, account_ids)
  """
  def get_streamer_subscription_keys(token, account_ids) do
    path =
      "https://api.tdameritrade.com/v1/userprincipals/streamersubscriptionkeys&accountIds=#{account_ids}"

    OAuth.get(token, path)
  end

  @doc """
  Preferences for a specific account.

  ## Example

         iex>  Ameritrade.get_streamer_subscription_keys!(token, account_ids)
  """
  def get_streamer_subscription_keys!(token, account_ids) do
    {_status, json} = get_streamer_subscription_keys(token, account_ids)

    json
  end

  @doc """
  Update preferences for a specific account.

  Please note that the directOptionsRouting and directEquityRouting values cannot be modified via this operation.

  ## Example

        iex>  Ameritrade.update_preferences(token, account_id, values)
  """
  def update_preferences(token, account_id, values) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/preferences"
    OAuth.put(token, path, values)
  end

  @doc """
  Update preferences for a specific account.

  Please note that the directOptionsRouting and directEquityRouting values cannot be modified via this operation.

  ## Example

        iex>  Ameritrade.update_preferences!(token, account_id, values)
  """
  def update_preferences!(token, account_id, values) do
    {_status, json} = Ameritrade.update_preferences(token, account_id, values)
    json
  end

  @doc """
  Account balances, positions, and orders for a specific account.

  ## Example

        iex>  Ameritrade.get_account(token, id, fields)
  """
  def get_account(_token, id, fields \\ []) do
    case(Enum.count(fields)) do
      0 ->
        "https://api.tdameritrade.com/v1/accounts/" <> id

      _ ->
        params = Enum.join(fields, ",")
        "https://api.tdameritrade.com/v1/accounts/#{id}?fields=#{params}"
    end
  end

  @doc """
  Account balances, positions, and orders for a specific account.

  ## Example

        iex>  Ameritrade.get_account!(token, id, fields)
  """
  def get_account!(token, id, fields \\ []) do
    {_status, json} = Ameritrade.get_account(token, id, fields)
    json
  end

  @doc """
  Account balances, positions, and orders for all linked accounts.

  ## Example

        iex>  Ameritrade.get_accounts(token, id, fields)
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
  Account balances, positions, and orders for all linked accounts.

  ## Example

        iex>  Ameritrade.get_accounts!(token, id, fields)
  """
  def get_accounts!(token, id, fields \\ []) do
    {_status, json} = Ameritrade.get_accounts(token, id, fields)
    json
  end

  @doc """
  Get quote for one or more symbols

  ## Example

         iex>  Ameritrade.get_quotes(token)
  """
  def get_quotes(token) do
    path = "https://api.tdameritrade.com/v1/marketdata/quotes"
    OAuth.get(token, path)
  end

  @doc """
  Get quote for one or more symbols

  ## Example

         iex>  Ameritrade.get_quotes!(token)
  """
  def get_quotes!(token) do
    {_status, json} = get_quotes(token)
    json
  end

  @doc """
  Get quote for a symbol

  ## Example

         iex>  Ameritrade.get_quote(token, symbol)
  """
  def get_quote(token, symbol \\ "GOOGL") do
    path = "https://api.tdameritrade.com/v1/marketdata/#{symbol}/quotes"
    OAuth.get(token, path)
  end

  @doc """
  Get quote for a symbol

  ## Example

        iex>  Ameritrade.get_quote!(token, symbol)
  """
  def get_quote!(token, symbol \\ "GOOGL") do
    {_status, json} = Ameritrade.get_quote(token, symbol)
    json
  end

  @doc """
  Orders for a specific account.

  ## Example

        iex>  Ameritrade.get_orders_by_path(token, account_id, order_id)
  """
  def get_orders_by_path(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/"
    OAuth.get(token, path)
  end

  @doc """
  Orders for a specific account.

  ## Example

        iex>  Ameritrade.get_orders_by_path!(token, account_id, order_id)
  """
  def get_orders_by_path!(token, account_id, order_id) do
    {_status, json} = Ameritrade.get_orders_by_path(token, account_id, order_id)
    json
  end

  @doc """
  All orders for a specific account or, if account ID isn't specified, orders will be returned for all linked accounts.

  ## Example

        iex>  Ameritrade.get_orders_by_query(token, map)
  """
  def get_orders_by_query(
        token,
        %{
          accountId: accountId,
          maxResults: maxResults,
          fromEnteredTime: fromEnteredTime,
          toEnteredTime: toEnteredTime,
          status: status
        }
      ) do
    path =
      "https://api.tdameritrade.com/v1/orders/?accountId=#{accountId}&maxResults=#{maxResults}&fromEnteredTime=#{fromEnteredTime}&toEnteredTime=#{toEnteredTime}&status#{status}"

    OAuth.get(token, path)
  end

  @doc """
  All orders for a specific account or, if account ID isn't specified, orders will be returned for all linked accounts.

  ## Example

        iex>  Ameritrade.get_orders_by_query!(token, map)
  """
  def get_orders_by_query!(
        token,
        %{
          accountId: accountId,
          maxResults: maxResults,
          fromEnteredTime: fromEnteredTime,
          toEnteredTime: toEnteredTime,
          status: status
        }
      ) do
    {_status, json} =
      Ameritrade.get_orders_by_query(
        token,
        %{
          accountId: accountId,
          maxResults: maxResults,
          fromEnteredTime: fromEnteredTime,
          toEnteredTime: toEnteredTime,
          status: status
        }
      )

    json
  end

  @doc """
  Get a specific order for a specific account.

  ## Example

        iex>  Ameritrade.get_order(token, account_id, order_id)
  """
  def get_order(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
    OAuth.get(token, path)
  end

  @doc """
  Get a specific order for a specific account.

  ## Example

        iex>  Ameritrade.get_order!(token, account_id, order_id)
  """
  def get_order!(token, account_id, order_id) do
    {_status, json} = Ameritrade.get_order(token, account_id, order_id)
    json
  end

  @doc """
  Cancel a specific order for a specific account.   Order throttle limits may apply.

  ## Example

        iex>  Ameritrade.cancel_order(token, account_id, order_id)
  """
  def cancel_order(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
    OAuth.delete(token, path)
  end

  @doc """
  Cancel a specific order for a specific account. Order throttle limits may apply.

  ## Example

        iex>  Ameritrade.cancel_order!(token, account_id, order_id)
  """
  def cancel_order!(token, account_id, order_id) do
    {_status, json} = Ameritrade.cancel_order(token, account_id, order_id)
    json
  end

  @doc """
  Place an order for a specific account.   Order throttle limits may apply.

  ## Example

        iex>  Ameritrade.place_order(token, account_id, order)
  """
  def place_order(token, account_id, order) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders"
    OAuth.post(token, path, order)
  end

  @doc """
  Place an order for a specific account.   Order throttle limits may apply.

  ## Example

        iex>  Ameritrade.place_order!(token, account_id, order)
  """
  def place_order!(token, account_id, order) do
    {_status, json} = Ameritrade.place_order(token, account_id, order)
    json
  end

  @doc """
  Replace an existing order for an account. The existing order will be replaced by the new order. Once replaced, the old order will be canceled and a new order will be created.   Order throttle limits may apply.

  ## Example

        iex>  Ameritrade.replace_order(token, account_id, order_id, new_order_data)
  """
  def replace_order(token, account_id, order_id, new_order_data) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/orders/#{order_id}"
    OAuth.put(token, path, new_order_data)
  end

  @doc """
  Replace an existing order for an account. The existing order will be replaced by the new order. Once replaced, the old order will be canceled and a new order will be created.   Order throttle limits may apply.

  ## Example

        iex>  Ameritrade.replace_order!(token, account_id, order_id, new_order_data)
  """
  def replace_order!(token, account_id, order_id, new_order_data) do
    {_status, json} = Ameritrade.replace_order(token, account_id, order_id, new_order_data)
    json
  end

  @doc """
  Save an order for a specific account.

  ## Example

        iex>  Ameritrade.create_saved_order(token, account_id, order)
  """
  def create_saved_order(token, account_id, order) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders"
    OAuth.post(token, path, order)
  end

  @doc """
  Save an order for a specific account.

  ## Example

        iex>  Ameritrade.create_saved_order!(token, account_id, order)
  """
  def create_saved_order!(token, account_id, order) do
    {_status, json} = Ameritrade.create_saved_order(token, account_id, order)
    json
  end

  @doc """
  Delete a specific saved order for a specific account.

  ## Example

        iex>  Ameritrade.delete_saved_order(token, account_id, order_id)
  """
  def delete_saved_order(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders/#{order_id}"

    OAuth.delete(token, path)
  end

  @doc """
  Delete a specific saved order for a specific account.

  ## Example

        iex>  Ameritrade.delete_saved_order!(token, account_id, order_id)
  """
  def delete_saved_order!(token, account_id, order_id) do
    {_status, json} = Ameritrade.delete_saved_order(token, account_id, order_id)
    json
  end

  @doc """
  Specific saved order by its ID, for a specific account.

  ## Example

        iex>  Ameritrade.get_saved_order(token, account_id, order_id)
  """
  def get_saved_order(token, account_id, order_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders/#{order_id}"

    OAuth.get(token, path)
  end

  @doc """
  Specific saved order by its ID, for a specific account.

  ## Example

        iex>  Ameritrade.get_saved_order!(token, account_id, order_id)
  """
  def get_saved_order!(token, account_id, order_id) do
    {_status, json} = Ameritrade.get_saved_order(token, account_id, order_id)
    json
  end

  @doc """
  Saved orders for a specific account.

  ## Example

        iex>  Ameritrade.get_saved_orders_by_path(token, account_id)
  """
  def get_saved_orders_by_path(token, account_id) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders"

    OAuth.get(token, path)
  end

  @doc """
  Saved orders for a specific account.

  ## Example

        iex>  Ameritrade.get_saved_orders_by_path!(token, account_id)
  """
  def get_saved_orders_by_path!(token, account_id) do
    {_status, json} = Ameritrade.get_saved_orders_by_path(token, account_id)
    json
  end

  @doc """
  Replace an existing saved order for an account. The existing saved order will be replaced by the new order.

  ## Example

        iex>  Ameritrade.replace_saved_order(token, account_id, saved_order_id, values)
  """
  def replace_saved_order(token, account_id, saved_order_id, values) do
    path = "https://api.tdameritrade.com/v1/accounts/#{account_id}/savedorders/#{saved_order_id}"

    OAuth.put(token, path, values)
  end

  @doc """
  Replace an existing saved order for an account. The existing saved order will be replaced by the new order.

  ## Example

        iex>  Ameritrade.replace_saved_order!(token, account_id, saved_order_id, values)
  """
  def replace_saved_order!(token, account_id, saved_order_id, values) do
    {_status, json} = Ameritrade.replace_saved_order(token, account_id, saved_order_id, values)
    json
  end

  @doc """
  Search or retrieve instrument data, including fundamental data.

  ## Example

        iex>  Ameritrade.get_search_instruments(token, symbol, projection)
  """
  def get_search_instruments(token, symbol, projection) do
    path =
      "https://api.tdameritrade.com/v1/instruments/?symbol=#{symbol}&projection=#{projection}"

    OAuth.get(token, path)
  end

  @doc """
  Search or retrieve instrument data, including fundamental data.

  ## Example

        iex>  Ameritrade.get_search_instruments!(token, symbol, projection)
  """
  def get_search_instruments!(token, symbol, projection) do
    {_status, json} = Ameritrade.get_search_instruments(token, symbol, projection)
    json
  end

  @doc """
  Get an instrument by CUSIP

  ## Example

        iex>  Ameritrade.get_instrument(token, cusip)
  """
  def get_instrument(token, cusip) do
    path = "https://api.tdameritrade.com/v1/instruments/#{cusip}"

    OAuth.get(token, path)
  end

  @doc """
  Get an instrument by CUSIP

        iex>  Ameritrade.get_instrument!(token, cusip)
  """
  def get_instrument!(token, cusip) do
    {_status, json} = Ameritrade.get_instrument(token, cusip)
    json
  end

  @doc """
  Top 10 (up or down) movers by value or percent for a particular market

  ## Example

        iex>  Ameritrade.get_movers(token, index, direction, change)
  """
  def get_movers(token, index, direction \\ "up", change \\ "value") do
    path =
      "https://api.tdameritrade.com/v1/instruments/#{index}?direction=#{direction}&change=#{change}"

    OAuth.get(token, path)
  end

  @doc """
  Top 10 (up or down) movers by value or percent for a particular market

  ## Example

        iex>  Ameritrade.get_movers!(token, index, direction, change)
  """
  def get_movers!(token, index, direction \\ "up", change \\ "value") do
    {_status, json} = Ameritrade.get_movers(token, index, direction, change)
    json
  end

  @doc """
  Get option chain for an optionable Symbol

  ## Example

        iex>  Ameritrade.get_option_chain(token,symbol,contractType,strikeCount,includeQuotes,strategy,interval,strike,range,fromDate,toDate,volatility,underlyingPrice,interestRate,daysToExpiration,expMonth,optionType)
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
  Get option chain for an optionable Symbol

  ## Example

        iex>  Ameritrade.get_option_chain!(token,symbol,contractType,strikeCount,includeQuotes,strategy,interval,strike,range,fromDate,toDate,volatility,underlyingPrice,interestRate,daysToExpiration,expMonth,optionType)
  """
  def get_option_chain!(
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
    {_status, json} =
      Ameritrade.get_option_chain(
        token,
        symbol,
        contractType,
        strikeCount,
        includeQuotes,
        strategy,
        interval,
        strike,
        range,
        fromDate,
        toDate,
        volatility,
        underlyingPrice,
        interestRate,
        daysToExpiration,
        expMonth,
        optionType
      )

    json
  end

  @doc """
  Get price history for a symbol

  ## Example

        iex>  Ameritrade.get_price_history(token,symbol, periodType,period,frequencyType,frequencyendDate,startDate,needExtendedHoursData)
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
  Get price history for a symbol

  ## Example

        iex>  Ameritrade.get_price_history!(token,symbol, periodType,period,frequencyType,frequencyendDate,startDate,needExtendedHoursData)
  """
  def get_price_history!(
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
    {_status, json} =
      Ameritrade.get_price_history(
        token,
        symbol,
        periodType,
        period,
        frequencyType,
        frequency,
        endDate,
        startDate,
        needExtendedHoursData
      )

    json
  end

  @doc """
  Transaction for a specific account.

  ## Example

        iex>  Ameritrade.get_transaction(token, accountId, transactionId)
  """
  def get_transaction(token, accountId, transactionId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/transactions/#{transactionId}"

    OAuth.get(token, path)
  end

  @doc """
  Transaction for a specific account.

  ## Example

        iex>  Ameritrade.get_transaction!(token, accountId, transactionId)
  """
  def get_transaction!(token, accountId, transactionId) do
    {_status, json} = Ameritrade.get_transaction(token, accountId, transactionId)
    json
  end

  @doc """
  Transactions for a specific account.

  ## Example

        iex>  Ameritrade.get_transactions(token, accountId, symbol, startDate, endDate)
  """
  def get_transactions(token, accountId, symbol, startDate, endDate) do
    path =
      "https://api.tdameritrade.com/v1/accounts/#{accountId}/transactions?symbol=#{symbol}&startDate=#{startDate}&endDate=#{endDate}"

    OAuth.get(token, path)
  end

  @doc """
  Transactions for a specific account.

  ## Example

        iex>  Ameritrade.get_transactions(token, accountId, symbol, startDate, endDate)
  """
  def get_transactions!(token, accountId, symbol, startDate, endDate) do
    {_status, json} = Ameritrade.get_transactions(token, accountId, symbol, startDate, endDate)
    json
  end

  @doc """
  Create watchlist for specific account.This method does not verify that the symbol or asset type are valid.

  ## Example

        iex>  Ameritrade.create_watchlist(token, accountId, data)
  """
  def create_watchlist(token, accountId, data) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists"

    OAuth.post(token, path, data)
  end

  @doc """
  Create watchlist for specific account.This method does not verify that the symbol or asset type are valid.

  ## Example

        iex>  Ameritrade.create_watchlist!(token, accountId, data)
  """
  def create_watchlist!(token, accountId, data) do
    {_status, json} = Ameritrade.create_watchlist(token, accountId, data)
    json
  end

  @doc """
  Delete watchlist for a specific account.

  ## Example

        iex>  Ameritrade.delete_watchlist(token, accountId, watchlistId)
  """
  def delete_watchlist(token, accountId, watchlistId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.delete(token, path)
  end

  @doc """
  Delete watchlist for a specific account.

        iex>  Ameritrade.delete_watchlist!(token, accountId, watchlistId)
  """
  def delete_watchlist!(token, accountId, watchlistId) do
    {_status, json} = Ameritrade.delete_watchlist(token, accountId, watchlistId)
    json
  end

  @doc """
  All watchlists for all of the user's linked accounts.

  ## Example

        iex>  Ameritrade.get_multiple_watchlist(token, accountId, watchlistId)
  """
  def get_multiple_watchlist(token, accountId, watchlistId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.get(token, path)
  end

  @doc """
  All watchlists for all of the user's linked accounts.

  ## Example

        iex>  Ameritrade.get_multiple_watchlist!(token, accountId, watchlistId)
  """
  def get_multiple_watchlist!(token, accountId, watchlistId) do
    {_status, json} = Ameritrade.get_multiple_watchlist(token, accountId, watchlistId)
    json
  end

  @doc """
   Specific watchlist for a specific account.

  ## Example

        iex>  Ameritrade.get_watchlists(token, accountId)
  """
  def get_watchlists(token, accountId) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists"

    OAuth.get(token, path)
  end

  @doc """
   Specific watchlist for a specific account.

  ## Example

        iex>  Ameritrade.get_watchlists!(token, accountId)
  """
  def get_watchlists!(token, accountId) do
    {_status, json} = Ameritrade.get_watchlists(token, accountId)
    json
  end

  @doc """
  Replace watchlist for a specific account. This method does not verify that the symbol or asset type are valid.

  ## Example

        iex>  Ameritrade.replace_watchlist(token, accountId, watchlistId, value)
  """
  def replace_watchlist(token, accountId, watchlistId, value) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.put(token, path, value)
  end

  @doc """
  Replace watchlist for a specific account. This method does not verify that the symbol or asset type are valid.

  ## Example

        iex>  Ameritrade.replace_watchlist!(token, accountId, watchlistId, value)
  """
  def replace_watchlist!(token, accountId, watchlistId, value) do
    {_status, json} = Ameritrade.replace_watchlist(token, accountId, watchlistId, value)
    json
  end

  @doc """
  Partially update watchlist for a specific account: change watchlist name, add to the beginning/end of a watchlist, update or delete items in a watchlist. This method does not verify that the symbol or asset type are valid.

  ## Example

        iex>  Ameritrade.update_watchlist(token, accountId, watchlistId, value)
  """
  def update_watchlist(token, accountId, watchlistId, value) do
    path = "https://api.tdameritrade.com/v1/accounts/#{accountId}/watchlists/#{watchlistId}"

    OAuth.patch(token, path, value)
  end

  @doc """
  Partially update watchlist for a specific account: change watchlist name, add to the beginning/end of a watchlist, update or delete items in a watchlist. This method does not verify that the symbol or asset type are valid.

  ## Example

        iex>  Ameritrade.update_watchlist!(token, accountId, watchlistId, value)
  """
  def update_watchlist!(token, accountId, watchlistId, value) do
    {_status, json} = Ameritrade.update_watchlist(token, accountId, watchlistId, value)
    json
  end
end
