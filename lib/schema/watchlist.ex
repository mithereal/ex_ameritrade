defmodule Ameritrade.Watchlist do
  defstruct name: nil,
            watchlistItems: []
            end

  defmodule Ameritrade.Watchlist.Items do
    defstruct quantity: 0,
              averagePrice: 0,
              commission: 0,
              purchasedDate: nil,
              instrument: nil
  end

  defmodule Ameritrade.Watchlist.Instrument do
    defstruct symbol: nil,
              assetType: nil
  end


defmodule Ameritrade.Watchlists do
  defstruct name: nil,
            watchlistId: nil,
            accountId: nil,
            status: nil,
            watchlistItems: []
            end

  defmodule Ameritrade.Watchlists.Items do
    defstruct sequenceId: 0,
              quantity: 0,
              averagePrice: 0,
              commission: 0,
              purchasedDate: nil,
              instrument: nil,
              status: nil
  end

  defmodule Ameritrade.Watchlists.Instrument do
    defstruct symbol: nil,
              description: nil,
              assetType: nil
  end

