defmodule Ameritrade.Candles do
  defstruct candles: [],
            empty: false,
            symbol: nil
            end

  defstruct Ameritrade.Candle do
    defstruct close: 0,
              datetime: 0,
              high: 0,
              low: 0,
              open: 0,
              volume: 0
  end
