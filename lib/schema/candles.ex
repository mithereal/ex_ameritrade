defmodule Ameritrade.Candles do
@moduledoc false
  defstruct candles: [],
            empty: false,
            symbol: nil
            end

  defmodule Ameritrade.Candle do
  @moduledoc false
    defstruct close: 0,
              datetime: 0,
              high: 0,
              low: 0,
              open: 0,
              volume: 0
  end
