defmodule Ameritrade.Watchlist do
  defstruct name: nil,
            watchlistItems: []

  defmodule Items do
    defstruct quantity: 0,
              averagePrice: 0,
              commission: 0,
              purchasedDate: nil,
              instrument: nil
  end

  defmodule Instrument do
    defstruct symbol: nil,
              assetType: nil
  end
end

defmodule Ameritrade.Watchlists do
  defstruct name: nil,
            watchlistId: nil,
            accountId: nil,
            status: nil,
            watchlistItems: []

  defmodule Items do
    defstruct sequenceId: 0,
              quantity: 0,
              averagePrice: 0,
              commission: 0,
              purchasedDate: nil,
              instrument: nil,
              status: nil
  end

  defmodule Instrument do
    defstruct symbol: nil,
              description: nil,
              assetType: nil
  end
end
