defmodule Ameritrade.Position do
  @moduledoc false
  @derive Jason.Encoder
  defstruct shortQuantity: 0,
            averagePrice: 0,
            currentDayProfitLoss: 0,
            currentDayProfitLossPercentage: 0,
            longQuantity: 0,
            settledLongQuantity: 0,
            settledShortQuantity: 0,
            agedQuantity: 0,
            instrument: nil,
            marketValue: 0
end
