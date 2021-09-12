defmodule Ameritrade.Watchlist do
  @moduledoc false

  @type t :: %__MODULE__{
          name: String.t() | nil,
          watchlistItems: list
        }
  @derive Jason.Encoder
  defstruct name: nil,
            watchlistItems: []
end

defmodule Ameritrade.Watchlist.Items do
  @moduledoc false

  @type t :: %__MODULE__{
          quantity: String.t() | nil,
          averagePrice: String.t() | nil,
          commission: String.t() | nil,
          purchasedDate: String.t() | nil,
          instrument: String.t() | nil
        }
  @derive Jason.Encoder
  defstruct quantity: 0,
            averagePrice: 0,
            commission: 0,
            purchasedDate: nil,
            instrument: nil
end

defmodule Ameritrade.Watchlist.Instrument do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            assetType: nil
end

defmodule Ameritrade.Watchlists do
  @moduledoc false
  @derive Jason.Encoder
  defstruct name: nil,
            watchlistId: nil,
            accountId: nil,
            status: nil,
            watchlistItems: []
end

defmodule Ameritrade.Watchlists.Items do
  @moduledoc false
  @derive Jason.Encoder
  defstruct sequenceId: 0,
            quantity: 0,
            averagePrice: 0,
            commission: 0,
            purchasedDate: nil,
            instrument: nil,
            status: nil
end

defmodule Ameritrade.Watchlists.Instrument do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            description: nil,
            assetType: nil
end
