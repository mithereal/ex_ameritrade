defmodule Ameritrade.Market.Hours do
@moduledoc false
  defstruct category: nil,
            date: nil,
            exchange: nil,
            isOpen: false,
            marketType: nil,
            product: nil,
            productName: nil,
            sessionHours: nil
end
