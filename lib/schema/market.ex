defmodule Ameritrade.Market.Hours do
  @moduledoc false
  @derive Jason.Encoder
  defstruct category: nil,
            date: nil,
            exchange: nil,
            isOpen: false,
            marketType: nil,
            product: nil,
            productName: nil,
            sessionHours: nil
end
