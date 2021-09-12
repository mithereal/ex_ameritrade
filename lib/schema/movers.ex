defmodule Ameritrade.Movers do
  @moduledoc false
  @derive Jason.Encoder
  defstruct change: 0,
            description: nil,
            direction: nil,
            last: 0,
            symbol: nil,
            totalVolume: 0
end
